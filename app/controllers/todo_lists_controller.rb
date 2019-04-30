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

	def new
		@todo_list = TodoList.new
		respond_to do |format|
			format.html
			format.json do 
				render json: @todo_list
			end
		end
	end

	def create
		@todo_list = TodoList.new(permitted_params)
		respond_to do |format|
			format.html do
				if @todo_list.save
				   flash[:success] = "TodoList is successfully created"
				   redirect_to todo_list_path(@todo_list)
				 else
				   # flash[:error] =  "Error while creating TodoList"
				   flash[:error] =  @todo_list.errors.full_messages
				   render :new 
				end
			end
			format.json do
				if @todo_list.save
					render json: {
						status: 200,
						message: "successfully created a todo list!",
						todo_list: @todo_list.to_json
					}
				else
					render json: { errors:  @todo_list.errors.full_messages }, status: 422
				end
			end
		end
	end

	def edit
		@todo_list = TodoList.find(params[:id])
		# byebug
	end

	def update
		@todo_list = TodoList.find(params[:id])
		@todo_list.update_attributes(permitted_params)
		if @todo_list.save
			redirect_to todo_list_path(@todo_list.id)
			flash[:success] = "TodoList successfully Updated!"
		else
			render :edit
			flash[:error] = "TodoList update failed!"
		end
		# byebug
	end

	def destroy
		@todo_list = TodoList.find(params[:id])
		@todo_list.destroy 
		redirect_to :index
		flash[:notice] = "Todolist successfully deleted!"
	end

	private
	    def permitted_params
	      params.require(:todo_list).permit(:title)
	    end
end
