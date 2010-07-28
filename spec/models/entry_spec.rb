require 'spec_helper'

describe Entry do
  
  context "when today is called" do
    it "should return only those entries created today" do
      yesterday = create_entry(1.day.ago)
      today     = create_entry(2.seconds.ago)
      tomorrow  = create_entry(1.day.from_now)
            
      Entry.today.size.should == 1
      Entry.today.first.should eq(today)
    end
  end
  
  def create_entry(creation_date)
    entry = Entry.new(:created => creation_date.utc)
    entry.save
    entry
  end
end
