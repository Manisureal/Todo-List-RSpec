class TodoListsController < ApplicationController
	def index
		@todo_lists = TodoList.all
		# respond_to do
		# 	format.json(@todo_lists)
		# end
		render :json => @todo_lists
		# render :index
	end
end
