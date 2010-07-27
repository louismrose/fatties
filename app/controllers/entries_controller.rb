class EntriesController < ApplicationController
  respond_to :html

  def index
    respond_with(@entries = Entry.all, @entry = Entry.new)
  end
  
  def create
    entry = Entry.new(params[:entry])
    entry.save
    
    redirect_to :action => 'index'
  end
end
