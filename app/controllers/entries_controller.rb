class EntriesController < ApplicationController
  before_filter :find_tracker

  def index
    @entries = @tracker.entries
    @entry_mode = params[:entry_mode] ? params[:entry_mode].to_sym : :points
  end
  
  def create
    if params[:entry][:points].try(:empty?)
      params[:entry][:points] = [0,
                                ((params[:protein].to_f / 10.9375) +
                                (params[:carbohydrate].to_f / 9.2105) +
                                (params[:fat].to_f / 3.8889) +
                                (params[:fibre].to_f / 35)).round].max
    end
    
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
