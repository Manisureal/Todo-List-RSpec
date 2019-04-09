class TodoListsController < ApplicationController
	def index
		@todo_lists = TodoList.all
		respond_to do |format|
		    format.html
		    format.json do
		      render json: @todo_lists
		    end
  		end
	end

	def show
		@todo_list = TodoList.find(params[:id])
		respond_to do |format|
			format.html
			format.json do
				render json: @todo_list
			end
		end
	end
end
