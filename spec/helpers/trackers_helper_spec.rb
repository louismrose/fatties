require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the TrackersHelper. For example:
#
# describe TrackersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe TrackersHelper do
  describe "month for" do
    def month_for(date)
      helper.month_for(Chronic.parse(date).to_date)
    end
    
    def the_day(date)
      Chronic.parse(date).to_date
    end
    
    it "should return correct number of dates" do
      month_for("28 July 2010").should have(31).dates
    end
    
    it "should contain first date of the month" do
      month_for("28 July 2010").should include(the_day("1 July 2010"))
    end
    
    it "should contain last date of the month" do
      month_for("28 July 2010").should include(the_day("31 July 2010"))
    end
    
    (1..31).each do |day|
      it "should contain the #{day} of the month" do
        month_for("28 July 2010").should include(the_day("#{day} July 2010"))
      end
    end
  end
end
