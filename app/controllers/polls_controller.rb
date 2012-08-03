class PollsController < ApplicationController
  
  respond_to :html
  
  def index
    @polls = Poll.all
    respond_with @polls
  end

  def new
    @poll = Poll.new
    respond_with @poll   #is this necessary?
  end
  
  def create
    @poll = Poll.new(params[:poll])
    @poll.edit_url = 10.times.map{(97 + rand(25)).chr}.join
    # SecureRandom.urlsafe_base64(6)
    #10 character string is generated
    # create_edit_url(params[:id])
    if @poll.save
      flash[:notice] = "Well done.  You just made a poll."
    end
    respond_with @poll   #if I comment this out, "template is missing error", but if other "respond_with" are commented out, no problem"
  end
  
  def edit
    @poll = Poll.find_by_edit_url(params[:edit_url])
    # render "public/404", layout: false unless @poll
  end

  def show
    @poll = Poll.find(params[:id])
    respond_with @poll
  end
  
  def update
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(params[:poll])
      flash[:success] = "Poll updated"
      redirect_to @poll
    else
      render 'edit'
    end
  end
  # respond_with @poll
end
