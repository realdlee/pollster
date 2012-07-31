class QuestionsController < ApplicationController
  
  respond_to :html

  def new
    @poll = Poll.find(params[:poll_id])
    @question = @poll.questions.new 
    warn "Poll before new:"
    warn @poll.inspect      
    respond_with [poll, @question]
  end
  
  def index
    @poll = Poll.find(params[:poll_id])
    @questions = Question.all
  end
  
  def edit
    # poll = Poll.find(params[:poll_id])
    @question = poll.questions.find(params[:id])
  end
  
  def create
    @question = Question.new(params[:question])
    @question.poll = Poll.find(params[:poll_id])
    if @question.save
        flash[:notice] = "Nice!  Question was successfully created."
        redirect_to poll_path(@question.poll_id)
    else
      respond_with @question
    end
  end
  
  def update
    # @question = Question.find(params[:id])   #this WORKS TOO!
    @question = poll.questions.find(params[:id])   #this WORKS TOO!
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated"
      redirect_to poll_questions_path
      # redirect_to poll_questions_path(poll)    THIS WORKS TOO with parameter
    end
  end
  
  def destroy
    question = poll.questions.find(params[:id])
    if question.destroy
      flash[:success] = "Brilliant!  Question deleted!"
      redirect_to poll_questions_path
    end
  end
  
  private 
   def poll
     @poll ||= Poll.find(params[:poll_id])
   end
  
end
