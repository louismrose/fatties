class EntriesController < ApplicationController
  before_filter :find_tracker

  def index
    @entries = @tracker.entries
  end
  
  def create
    @entry = @tracker.create_entry(params[:entry])    
    
    if request.format.html?
      redirect_to :action => 'index'
    else
      @entries = @tracker.entries
      render 'create'
    end
  end

private
  def find_tracker
    @tracker = Tracker.from_s(params[:tracker_id])
  end
end
