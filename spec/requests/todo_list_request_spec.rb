require 'rails_helper'

RSpec.describe "Todo List", :type => :request do

  describe "GET index" do
    before do
        titles_arr = %w(first_todo second_todo third_todo fourth_todo fifth_todo)
        titles_arr.each do |title|
          TodoList.create title: title
        end
    end

    let(:todo_lists) { TodoList.all }

    it "goes to the index page and displays all todo lists" do
      get todo_lists_path
      expect(response).to render_template :index
      expect(response).to have_http_status(200)
      expect(assigns['todo_lists']).to match(todo_lists)
    end
  end
end

