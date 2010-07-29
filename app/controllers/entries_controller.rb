class EntriesController < ApplicationController

  def index
    @date = params[:date] || Date.today
    @entries = Entry.for_date(@date)
    @entry = Entry.new
  end
  
  def create
    entry = Entry.new(params[:entry])
    entry.created = Time.now.utc
    entry.save
    
    redirect_to :action => 'index'
  end
end
