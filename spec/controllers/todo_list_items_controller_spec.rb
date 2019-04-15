require 'rails_helper'

RSpec.describe TodoListItemsController, type: :controller do
	let(:todo_list) { TodoList.create title: "a todo list" }

	let(:todo_list_items) do 
		title_arr = ["first todo list item","second todo list item","third todo list item"]
		title_arr.each do |ta|
			todo_list.todo_list_items.create description: ta
		end
		todo_list.todo_list_items
	end
 	

	describe "GET new" do
		before(:example) { get :new, params: { id: todo_list.id }}

		it "should respond with http status 200 :ok" do
			expect(response).to have_http_status(200)
		end

		it "should render template :new" do
			expect(response).to render_template(:new)
		end
	end

	describe "POST create" do
		
		context "with valid params" do
			before { post :create, params: { id: todo_list.id, todo_list_items: { description: "need to call BT for connection arrangements", completed: false } } }

			it "should redirect back to todo_list new form" do
				expect(response).to redirect_to("todo_lists/:#{todo_list.id}/todo_list_items/new")
			end
		end
		

		context "with invalid params" do
			let(:todo_list_item) { TodoListItem.create(todo_list_id: todo_list.id ) }

			before { post :create, params: { id: todo_list.id, todo_list_items: { description: "", completed: "" }}}

			it "should render new" do
				expect(response).to render_template :new
			end

			it "should display error messages" do
				expect(flash[:error]).to eq(todo_list_item.errors.full_messages)
			end
		end
	end

	describe "GET show" do
		before do
			todo_list_items.each do |item|
		 		get :show, params: { id: item.id }
			end
		end

		it "should respond with http status 200 :ok" do
			expect(response).to have_http_status(200)
		end

		it "should render template :show for specific todo_list_item" do
			expect(response).to render_template(:show)
		end
	end

	describe "GET edit" do
		before do 
			todo_list_items.each do |item|
				get :edit, params: { id: item.id }
			end
		end

		it "should respond with http status ok(:200)" do
			expect(response).to have_http_status(200)
		end

		it "should render template :edit" do
			expect(response).to render_template(:edit)
		end
	end

	
end
