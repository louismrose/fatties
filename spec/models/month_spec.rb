require 'spec_helper'

describe Month do

  describe "trackers" do
    def month_for(date)
      Month.new(Chronic.parse(date).to_date)
    end
    
    def a_tracker_for(date)
      Tracker.new(Chronic.parse(date).to_date)
    end
    
    it "should return correct number of dates" do
      month_for("28 July 2010").trackers.should have(31).dates
    end
    
    it "should contain first date of the month" do
      month_for("28 July 2010").trackers.should include(a_tracker_for("1 July 2010"))
    end
    
    it "should contain last date of the month" do
      month_for("28 July 2010").trackers.should include(a_tracker_for("31 July 2010"))
    end
    
    (1..31).each do |day|
      it "should contain the #{day} of the month" do
        month_for("28 July 2010").trackers.should include(a_tracker_for("#{day} July 2010"))
      end
    end
  end
end