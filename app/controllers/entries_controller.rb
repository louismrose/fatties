class EntriesController < ApplicationController
  before_filter :find_tracker

  def index
    @entries = @tracker.entries
  end
  
  def create
    @tracker.create_entry(params[:entry])
    
    redirect_to :action => 'index'
  end

private
  def find_tracker
    @tracker = Tracker.from_s(params[:tracker_id])
  end
end
