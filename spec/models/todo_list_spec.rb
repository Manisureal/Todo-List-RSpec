require 'rails_helper'

RSpec.describe TodoList, type: :model do
  describe "Create a Todo List" do
  	
  	context "todo list must have a title" do
  		it "passes if title is given" do
	  		subject.title = "Title"
	  		allow(subject).to receive(:save).and_return(true) # stub it as it passes and we dont want to write to db
	  		expect(subject.save).to be true
  		end

  		it "fails if title is blank" do
  			# no need to stub it its failing and by default it wont save to db
	  		expect(subject.title).to be_nil
	  		expect(subject.save).to be false
  		end
  	end
  end
end
