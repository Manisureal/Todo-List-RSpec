module TodoListsHelper
	def display_form_errors(obj)
		obj.errors.full_messages.each do |e|
			return e
		end
	end
end
