class MessagesController < ApplicationController
  def destroy
    @message.destroy!

    @message.broadcast_remove_to @message.room, target: @message

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to messages_path, status: :see_other, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end

  def new
    @message = Message.new
    @room = Room.find(params[:room_id]) # สมมุติว่า room_id ถูกส่งจาก URL
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params) # เชื่อมโยงกับ room
    
    if @message.save
      redirect_to @room
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id) # room_id อาจจะไม่จำเป็นถ้าใช้ association
  end
end
