class TodoList < ApplicationRecord
	validates :title, presence: true
end
