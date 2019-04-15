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
 	
	before do
		todo_list_items.each do |item|
	 		get :show, params: { id: item.id }
		end
	end

	describe "GET show" do
		it "should respond with http status 200 :ok" do
			expect(response).to have_http_status(200)
		end
		it "should render template :show for specific todo_list_item" do
			expect(response).to render_template(:show)
		end
	end

end
