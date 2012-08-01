require 'spec_helper'

describe Poll do
  # it { should validate_presence_of :title }
  # it { should validate_presence_of :edit_url }
  
  # it "creates the proper relationship with questions" do
  #   poll = Poll.new
  #   poll.should have_many(:questions) 
  # let(:poll) { Fabricate(:poll)}
  
  context "Poll#new" do 
      it "instantiates properly" do
      poll = Poll.new
      poll.should be_an_instance_of Poll
    end
  end
  
end
