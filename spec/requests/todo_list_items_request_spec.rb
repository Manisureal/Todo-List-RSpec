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

    it "should not go to show page" do
      get edit_todo_list_item_path(todo_list_item)
      expect(response).not_to render_template :show
    end

    context "with Valid Params" do
      it "should update the todo_list_item and redirect_to todo_list" do
        patch todo_list_item_path(todo_list_item), params: { todo_list_item: { description: "updated todo list item" } }
        expect(response).to redirect_to todo_list_path(todo_list)
        follow_redirect!
        expect(response.body).to include flash[:success]
      end
    end

    context "with Invalid Params" do
      it "should render edit and flash error" do
        patch todo_list_item_path(todo_list_item), params: { todo_list_item: { description: "" } }
        expect(response).to render_template :edit
        expect(response.body).to include flash[:error]
      end
    end
  end
end