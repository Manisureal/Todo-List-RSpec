require 'rails_helper'

RSpec.describe TodoListItem, type: :model do
	describe "Add Todo List Item to Todo List" do
		context "Todo List Items Associations" do
	  		it { is_expected.to belong_to :todo_list }
		end

		context "Todo List Items Validations" do
			it { is_expected.to validate_presence_of :description }
		end

		context "Todo List Item completed default value" do
			it "should be false by default" do
				expect(subject.completed).to be false
			end
		end

	end
end
