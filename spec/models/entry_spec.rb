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
      Entry.find_by_date(Date.today)
    end
  end
  
  context "when favourites is called" do
    it "should return foods ordered by most entries" do
      3.times { create_entry('Banana', 2) }
      5.times { create_entry('Apple',  0.5) }
      2.times { create_entry('Pear',   1) }
      
      favourites.size.should == 3 
      
      favourites.first.name.should   == 'Apple'
      favourites.first.points.should == 0.5
      
      favourites.second.name.should   == 'Banana'
      favourites.second.points.should == 2
      
      favourites.third.name.should   == 'Pear'
      favourites.third.points.should == 1
    end
    
    it "should be limited to the top five foods" do
      3.times { create_entry('Banana') }
      3.times { create_entry('Apple') }
      3.times { create_entry('Pear') }
      3.times { create_entry('Grapes') }
      3.times { create_entry('Mango') }
      2.times { create_entry('Kiwi') }
      
      favourites.size.should == 5
      favourites.map {|entry| entry.name }.should_not include('Kiwi')
    end
    
    def create_entry(food, points = 1)
      Entry.create(:name => food, :points => points)
    end
    
    def favourites
      Entry.favourites
    end
  end
end
