require 'spec_helper'

describe Entry do
    
  context "when for_date is called" do
    it "should return only those entries created on the specified date" do
      first  = create_entry(2.seconds.ago)
      second = create_entry(1.second.ago)
      
      create_entry(1.day.ago)
      create_entry(1.day.from_now)
            
      todays_entries.size.should == 2
      todays_entries.include? eq(first)
      todays_entries.include? eq(second)
    end
    
    def create_entry(creation_date)
      Entry.create(:created => creation_date.utc)
    end
    
    def todays_entries
      Entry.for_date(Date.today)
    end
  end
end
