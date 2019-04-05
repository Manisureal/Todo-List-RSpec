class TodoList < ApplicationRecord
	has_many :todo_list_items
	validates :title, presence: true

	def improve_title_text
		# if self.valid?
			title.titleize
		# end
	end
end