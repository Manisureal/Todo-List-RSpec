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

  describe "GET new/POST create" do
    it "should go to new page and render a new form" do
      get todo_lists_new_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "should create a new todo list and then redirect to it" do
      post '/todo_lists', params: { todo_list: { title: "First Todo List" } }
      expect(response).to redirect_to(assigns :todo_list)
      follow_redirect!

      expect(response).to render_template :show
      expect(response.body).to include(flash[:success])
    end

    it "should not render a wrong template" do
      get todo_lists_new_path
      expect(response).not_to render_template :show
    end
  end

  describe "GET show" do

    let(:todo_list) { TodoList.create title: "my show todo list" }

    it "should show a todo_list and display its content" do
      get todo_list_path(todo_list)
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
      expect(assigns :todo_list).to eq todo_list
    end
  end
end