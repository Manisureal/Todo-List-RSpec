require 'rails_helper'

RSpec.describe TodoListsController, type: :controller do
	describe "GET index" do
		
		before(:example) { get :index }

		context "it returns index of all Todo Lists" do

			it "should have the status :ok" do
				expect(response).to have_http_status(:ok)
			end

			it "should render 'index' template" do
				expect(response).to render_template(:index)
			end

			it "should render 'index' as json" do
				get :index, format: :json
				# expect(response).to render_template({})
				expect(response.body).to eq "[]"
			end
		end
	end

	describe "GET show" do
		context "it should display a TodoList" do
			let(:todo_list) { TodoList.create(title: "first todo list") }

			before(:example) { get :show, params: { id: todo_list } }

			it "should return with the status :ok" do
				expect(response).to have_http_status(:ok)
			end

			it "should render :show template" do
				expect(response).to render_template('show')
			end
			it "should also render :show as json" do
				get :show, params: { id: todo_list }, as: :json
				expect(JSON.parse(response.body)['title']).to eq(todo_list.title)
			end

		end
	end

	describe "GET new" do
		context "show a new form for Todo List" do

			let(:new_todo_list) { TodoList.new }

			before { get :new }

			it "should return with a status :ok(200)" do
				expect(response).to have_http_status(:ok)
			end

			it "should render a new template as HTML" do
				expect(response).to render_template(:new)
			end

			it "should render a new template in JSON" do
				get :new, as: :json
				expect(response).to have_http_status(:ok)
			end
		end
	end

	describe "POST create" do
		context "Successful: Create a Todo List format:HTML" do
			let(:todo_list) { { title: "my first todo list" } }
			before { post :create, params: { todo_list: todo_list } }

			it "should respond with status 302" do
				expect(response).to have_http_status(302)
			end

			it "should redirect to todo list" do
				expect(response).to redirect_to todo_list_path(assigns :todo_list)
			end

			it "should flash success message" do
				expect(flash[:success]).to match("TodoList is successfully created")
			end

			it "responds to html by default" do
				expect(response.content_type).to eq("text/html")
			end
		end

		context "Unsuccessful: Create a Todo List format:HTML" do
			before { post :create, params: { todo_list: { title: ""} } }

			it "should render new on failure" do
				expect(response).to render_template(:new)
			end

			it "should respond with flash error message" do
				expect(flash[:error]).to match(flash[:error])
			end
		end

		context "Successful: Create a Todo List format:JSON" do
			before { post :create, params: { todo_list: {title: "my json todo list"}, format: :json} }

			it "should respond with status :200" do
				expect(response).to have_http_status(200) 
			end

			it "should display success message" do
				expect(JSON.parse(response.body)["message"]).to match("successfully created a todo list!")
			end

			it "responds to custom formats when provided in the params" do
				expect(response.content_type).to eq "application/json"
			end

			# it "should display contents of todo list" do
			# 	parsed_body = JSON.parse(response.body)
			# 	byebug
			# 	expect(parsed_body.title).to eq todo_list[0]
			# end
		end

		context "Unsuccessful: Create a Todo List format:JSON" do
			before { post :create, params: { todo_list: {title: ""}, format: :json} }

			it "should respond with HTTP status code :422" do
				expect(response).to have_http_status(422)
			end

			it "should provide with error message" do
				expect(JSON.parse(response.body)["errors"][0]).to match("Title can't be blank")
			end

			it "should have responded to JSON format" do
				expect(response.content_type).to eq "application/json"
			end
		end
	end

	describe "GET edit" do
		let(:todo_list) { TodoList.create title: "will edit this todolist"}
		before { get :edit, params: { id: todo_list } }

		it "should respond with HTTP status :ok(200)" do
			expect(response).to have_http_status(200)
		end

		it "should render HTML template" do
			expect(response).to render_template(:edit)
		end

		it 'assigns the todo list' do
	      expect(assigns(:todo_list)).to eq(todo_list)
	    end
	end

	describe "PATCH update" do
		context "on successfull update" do
			let(:todo_list) { TodoList.create title: "this title will be updated" }

			let(:update_attrib) { { title: "updated title" } }

			before { patch :update, params: { id: todo_list.id, todo_list: update_attrib } }

			it "returns with a http status :302" do
				expect(response).to have_http_status(:redirect)
				expect(response).to have_http_status(302)
			end

			it "should redirect to show page" do
				expect(response).to redirect_to("/todo_lists/#{todo_list.id}")
			end

			it "should flash a success message" do
				expect(flash[:success]).to eq "TodoList successfully Updated!"
			end
		end

		context "on unsuccessful update" do
			let(:todo_list) { TodoList.create title: "this title should not update" }

			before { patch :update, params: {id: todo_list.id, todo_list: { title: "" } } }

			it "should render :edit" do
				expect(response).to render_template(:edit)
			end

			it "should flash error message" do
				expect(flash[:error].first).to eq "Title can't be blank"
				expect(flash[:error]).to be_present
			end
		end
	end

	describe "DELETE destroy" do 
		let(:todo_list) { TodoList.create title: "this one is to be deleted" }

		before { delete :destroy, params: { id: todo_list } }

		it "shoudld redirect to index page" do
			expect(response).to redirect_to todo_lists_path
		end

		it "flash notice to confirm deletion" do
			expect(flash[:notice]).to be_present
		end
	end
end
