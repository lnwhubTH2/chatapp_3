class TodosController < ApplicationController
    def index
      @category = Category.find(params[:category_id])
      @todos = @category.todos
    end
  
    def new
      @category = Category.find(params[:category_id])
      @todo = @category.todos.build
    end
  
    def create
      @category = Category.find(params[:category_id])
      @todo = @category.todos.build(todo_params)
      if @todo.save
        redirect_to category_todos_path(@category), notice: 'Todo created successfully.'
      else
        render :new
      end
    end
  
    private
  
    def todo_params
      params.require(:todo).permit(:title, :description)
    end
  end
  class TodosController < ApplicationController
    before_action :set_todo, only: %i[show edit update destroy]
  
    def index
      @todos = Todo.all
    end
  
    def show
    end
  
    def new
      @todo = Todo.new
      @categories = Category.all # Load categories for the select dropdown
    end
  
    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        redirect_to todos_path, notice: 'Todo was successfully created.'
      else
        @categories = Category.all
        render :new
      end
    end
  
    def edit
      @categories = Category.all # Load categories for the select dropdown
    end
  
    def update
      if @todo.update(todo_params)
        redirect_to todos_path, notice: 'Todo was successfully updated.'
      else
        @categories = Category.all
        render :edit
      end
    end
  
    def destroy
      @todo.destroy
      redirect_to todos_path, notice: 'Todo was successfully deleted.'
    end
  
    private
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:title, :description, :category_id)
    end
  end
  def new
    @todo = Todo.new
    @categories = Category.all
  end
  
  def create
    @todo = Todo.new(todo_params)
    @todo.status = :incomplete # Set default status to incomplete
    if @todo.save
      redirect_to todos_path, notice: 'Todo was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end
  
  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: 'Todo was successfully updated.'
    else
      @categories = Category.all
      render :edit
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title, :description, :category_id, :status)
  end
  def complete
    @todo = Todo.find(params[:id])
    @todo.complete!
    redirect_to todos_path, notice: 'Todo marked as complete.'
  end
  
  def incomplete
    @todo = Todo.find(params[:id])
    @todo.incomplete!
    redirect_to todos_path, notice: 'Todo marked as incomplete.'
  end
  