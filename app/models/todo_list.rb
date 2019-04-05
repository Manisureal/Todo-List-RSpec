class TodoList < ApplicationRecord
	validates :title, presence: true

	def improve_title_text
		# if self.valid?
			title.titleize
		# end
	end
end