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
end
