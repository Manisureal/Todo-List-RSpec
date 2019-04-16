class TodoListItemsController < ApplicationController

	def new
		@todo_list = TodoList.find(params[:id])
		@todo_list_items = @todo_list.todo_list_items.new
	end

	def create
		@todo_list = TodoList.find(params[:id])
		@todo_list_items = @todo_list.todo_list_items.new(todo_list_items_params)
		if @todo_list_items.save
			redirect_to "todo_lists/:#{@todo_list.id}/todo_list_items/new"
		else
			render :new #"todo_lists/:#{@todo_list.id}/todo_list_items/new"
			flash[:error] = @todo_list_items.errors.full_messages
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		# @todo_list = TodoList.find(params[:todo_list_id])
		@todo_list_item = TodoListItem.find(params[:id])
		if @todo_list_item.update_attributes(todo_list_items_params)
			redirect_to "/todo_lists/#{params[:todo_list_item][:todo_list_id]}"
			flash[:success] = "todo list item was successfully updated!"
		else
			render :edit
			flash[:error] = @todo_list_item.errors.full_messages
		end
		
	end

	private

	def todo_list_items_params
		params.require(:todo_list_item).permit(:description, :completed)
	end

end
