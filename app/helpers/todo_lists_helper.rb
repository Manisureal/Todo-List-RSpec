module TodoListsHelper
	def display_form_errors(errors)
		if errors.class == Array
			if errors.count > 1
				errors[0..-2].join() + ", " + errors[-1]
			else
				errors.pop if errors.count == 1
			end
		else
			errors
		end
	end
end
