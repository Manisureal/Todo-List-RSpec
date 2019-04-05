require 'rails_helper'

RSpec.describe TodoList, type: :model do
  describe "Todo List Associations" do
    it { is_expected.to have_many :todo_list_items }
  end

  describe "Create a Todo List" do
  	
  	context "todo list must have a title" do
  		it "passes if title is given" do
	  		subject.title = "Title"
	  		# allow(subject).to receive(:save).and_return(true) # stub it as it passes and we dont want to write to db
	  		expect(subject.valid?).to be true
  		end

  		it "fails if title is blank" do
  			# no need to stub it its failing and by default it wont save to db
	  		expect(subject.title).to be_nil
	  		expect(subject.valid?).to be false
  		end
  	end

  	context "#improve_title_text" do
  		it "converts a todolist title by capitalizing first letter of every word" do
  			todo_list = TodoList.new title: "weekend shopping list"
  			# allow(todo_list.title).to receive(:blank?).and_return(false)
  			# allow(todo_list).to receive(:valid?).and_return(true)
  			# p todo_list.blank?
  			expect(todo_list.improve_title_text).to eq("Weekend Shopping List")
  		end
  	end
  end
end
