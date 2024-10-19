
class Todo < ApplicationRecord
  belongs_to :category
  
  validates :title, presence: true
  validates :description, presence: true

  # Define status as an enum
  enum status: { incomplete: 0, complete: 1 }
end

