class Category < ApplicationRecord
    has_many :todos, dependent: :destroy
  end
  
  class Category < ApplicationRecord
    validates :name, presence: true
  end