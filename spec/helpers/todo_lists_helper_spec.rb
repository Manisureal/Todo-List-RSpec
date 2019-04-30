require 'rails_helper'

RSpec.describe TodoListsHelper, type: :helper do
  describe "#display_form_errors(error)" do

  	let(:errors) { ['error1', 'error2'] }

  	it "should display error message when creating/editing todolist or todolist item" do
  		expect(helper.display_form_errors(errors)).to eq('error1, error2')
  	end
  end
end