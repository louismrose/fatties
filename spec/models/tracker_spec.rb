require 'spec_helper'

describe Tracker do
  before(:all) do
    @date    = Date.today
    @tracker = Tracker.new(@date)
  end
  
  it "should wrap a date" do
    @tracker.date.should eq(@date)
  end
  
  it "to_param should stringify the date" do
    @tracker.to_param.should eq(@date.to_s)
  end
  
  it "entries should delegate to Entry.for_date" do
    Entry.stub(:find_by_date).with(@date) {["dummy", "entries"]}
    
    @tracker.entries.should eq(["dummy", "entries"])
  end
  
  it "create_entry should create an entry with the tracker's date" do
    Entry.stub(:new).with("dummy" => "params") { mock_entry }
    mock_entry.should_receive(:created=).with(@date.to_time(:utc))
    mock_entry.should_receive(:save)
    
    @tracker.create_entry("dummy" => "params").should == mock_entry
  end
  
private
  def mock_entry(stubs={})
    @mock_entry ||= mock_model(Entry, stubs).as_null_object
  end
end
