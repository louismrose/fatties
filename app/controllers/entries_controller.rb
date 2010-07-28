class EntriesController < ApplicationController

  def index
    @entries = Entry.today
    @entry = Entry.new
  end
  
  def create
    entry = Entry.new(params[:entry])
    entry.created = Time.now.utc
    entry.save
    
    redirect_to :action => 'index'
  end
end
