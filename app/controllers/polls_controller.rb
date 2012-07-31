class PollsController < ApplicationController
  
  respond_to :html
  
  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.new(params[:poll])
    @poll.edit_url = 10.times.map{(97 + rand(25)).chr}.join
    #10 character string is generated
    # create_edit_url(params[:id])
    if @poll.save
      flash[:notice] = "Well done.  You just made a poll."
    end
    respond_with @poll
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
    warn "Poll before update:"
    warn @poll.inspect
    if @poll.update_attributes(params[:poll])
      flash[:success] = "Poll updated"
      redirect_to @poll
    else
      render 'edit'
    end
  end
end
