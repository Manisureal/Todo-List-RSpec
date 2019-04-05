class TodoListItem < ApplicationRecord
  belongs_to :todo_list
  validates :description, presence: true
end
