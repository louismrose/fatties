require 'spec_helper'
require 'nokogiri'

describe "trackers/index.html.erb" do
  context "for a date in July 2010" do
    before(:each) do
      a_date_in_july = Chronic.parse("22 July 2010").to_date
      assign(:month, Month.new(a_date_in_july))
      render
      @calendar = Calendar.new rendered
    end
    
    it "the calendar should show five weeks" do
      @calendar.number_of_weeks.should == 5
    end
    
    it "the first Monday to Wednesday should be empty" do
      first_week = @calendar.first_week
      
      first_week.monday.empty?.should    be_true
      first_week.tuesday.empty?.should   be_true
      first_week.wednesday.empty?.should be_true
    end
    
    it "the first Thursday should be the 1st" do
      @calendar.first_week.thursday.date.should == '1'
    end
    
    it "the last Saturday should be the 31st" do
      @calendar.last_week.saturday.date.should == '31'
    end
  end
  
  context "for a date in a month starting on a Monday" do
    before(:each) do
      assign(:month, Month.new(Chronic.parse("22 November 2010").to_date))
      render
      @calendar = Calendar.new rendered
    end
    
    it "the first Monday should be the 1st" do
      @calendar.first_week.monday.date.should == '1'
    end
  end
  
  context "for a date in a month ending on a Sunday" do
    before(:each) do
      assign(:month, Month.new(Chronic.parse("22 October 2010").to_date))
      render
      @calendar = Calendar.new rendered
    end

    it "the last Sunday should be the 31st" do
      @calendar.last_week.sunday.date.should == '31'
    end
  end
end


class Calendar
  def initialize(html)
    @doc = Nokogiri.parse("<div>" + html + "</div>")
  end
  
  def first_week
    Week.new weeks.first.css('td')
  end
  
  def last_week
    Week.new weeks.last.css('td')
  end
  
  def today
    Cell.new weeks.css('.today').first
  end
  
  def number_of_weeks
    weeks.size
  end

private
  def weeks
    @doc.css('tbody').first.css('tr')
  end
end

class Week
  def initialize(tr_node)
    @tr = tr_node
  end
  
  def monday
    day 0
  end
  
  def tuesday
    day 1
  end
  
  def wednesday
    day 2
  end
  
  def thursday
    day 3
  end
  
  def friday
    day 4
  end
  
  def saturday
    day 5
  end
  
  def sunday
    day 6
  end
  
private
  def day(index)
    Cell.new @tr.css('td')[index]
  end
end

class Cell
  def initialize(td_node)
    @td = td_node
  end
  
  def empty?
    @td.css('.date').empty?
  end
  
  def has_date?
    not empty?
  end
  
  def date
    if has_date? 
      @td.css('.date').first.content
    end
  end
end