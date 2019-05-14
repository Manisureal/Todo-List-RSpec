require 'rails_helper'

RSpec.describe "Todo List Items", :type => :request do
	let(:todo_list) { TodoList.create title: 'testing its items' }

	describe "GET new/Post create" do
		it "should display a new form" do
			get new_todo_list_item_path(todo_list)
			expect(response).to have_http_status :ok

		end
	end
end

