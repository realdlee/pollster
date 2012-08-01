require 'spec_helper'

describe Question do
  context "Question#new" do 
      it "instantiates properly" do
      question = Question.new
      question.should be_an_instance_of Question
    end
  end
  # it { should belong_to :poll }
end
