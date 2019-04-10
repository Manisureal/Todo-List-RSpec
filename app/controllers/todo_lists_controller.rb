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
				   redirect_to :index
				   flash[:success] = "TodoList is successfully created"
				 else
				   render :new 
				   flash[:error] =  "Error while creating TodoList"
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

	private
	    def permitted_params
	      params.require(:todo_list).permit(:title)
	    end
end
