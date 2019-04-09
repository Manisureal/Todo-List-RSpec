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
				expect(response).to render_template({})
			end

		end
	end
end
