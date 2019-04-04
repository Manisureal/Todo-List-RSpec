require 'rails_helper'

RSpec.describe TodoList, type: :model do
  context "create a todo list" do
  	it "todo list must have a title" do
  		expect(subject.title).to be_nil
  		expect(subject.save).to be false
  	end
  end
end
