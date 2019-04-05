require 'rails_helper'

RSpec.describe TodoListItem, type: :model do
	describe "Todo List Items Associations" do
  		it { is_expected.to belong_to :todo_list }
	end
end
