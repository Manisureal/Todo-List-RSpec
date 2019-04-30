module TodoListsHelper
	def display_form_errors(error)
		flash[error].each do |e|
			return e
		end
	end
end
