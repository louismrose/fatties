class TrackersController < ApplicationController
  def index
    @month = Month.new(Date.today)
  end
end