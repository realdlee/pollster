class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params[:id])
    if @question.save
        flash[:notice] = "Question was successfully created."
    end
    
  end
  
end
