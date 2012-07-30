class PollsController < ApplicationController
  
  respond_to :html, :xml
  
  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.new(params[:poll])
    @poll.edit_url = 10.times.map{(97 + rand(25)).chr}.join
    #10 character string is generated
    warn "Poll before save:"
    warn @poll.inspect
    
    # create_edit_url(params[:id])
    if @poll.save
      flash[:notice] = "Poll was successfully created."
    end
    
    respond_with @poll
  end
  
  def edit
    @poll = Poll.find_by_edit_url(params[:edit_url])
  end

  def show
    @poll = Poll.find(params[:id])
    respond_with @poll
  end
  
  
end
