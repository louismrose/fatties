class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    @entry = Entry.new
  end
  
  def create
    entry = Entry.new(params[:entry])
    entry.save
    
    redirect_to :action => 'index'
  end
end
