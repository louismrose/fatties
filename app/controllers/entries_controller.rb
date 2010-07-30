class EntriesController < ApplicationController
  before_filter :determine_date_from_params

  def index
    @entries = Entry.for_date(@date)
    @entry = Entry.new
  end
  
  def create
    entry = Entry.new(params[:entry])
    entry.created = @date.to_time(:utc)
    entry.save
    
    redirect_to :action => 'index', :date => params[:date]
  end

private
  def determine_date_from_params
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
