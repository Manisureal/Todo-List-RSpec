require 'rails_helper'

RSpec.describe "Todo List Items", :type => :request do
  describe "GET edit/ PATCH update" do
    let(:todo_list) { TodoList.create title: "Todo list will have todo list items" }
    let(:todo_list_item) { todo_list.todo_list_items.create description: "first item" }

    it "should go to the edit page and display current todo list item to edit" do
      get edit_todo_list_item_path(todo_list_item)
      expect(response).to have_http_status :ok
      expect(response).to render_template :edit
      expect(response.body).to include todo_list_item.description
    end
  end
end