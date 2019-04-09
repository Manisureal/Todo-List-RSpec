require 'rails_helper'

RSpec.describe TodoListsController, type: :controller do
	describe "GET index" do
		
		before(:example) { get :index }

		context "it returns index for all Todo Lists" do

			it "should have the status :ok" do
				expect(response).to have_http_status(:ok)
			end

			it "should render 'index' template" do
				# byebug
				expect(response).to render_template({})
			end
		end
	end
end
