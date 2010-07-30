require 'spec_helper'

describe EntriesController do

  def mock_entry(stubs={})
    @mock_entry ||= mock_model(Entry, stubs).as_null_object
  end

  describe "GET 'index'" do
    context "when no date is specified" do
      before(:each) do
        Entry.stub(:for_date).with(Date.today) { [mock_entry, mock_entry] }
        Entry.stub(:new) { mock_entry }
      
        get 'index'
      end
    
      it "should be successful" do
        response.should be_success
      end
    
      it "should render the index template" do
        response.should render_template('index')
      end
    
      it "should assign date to today's date" do
        assigns(:date).should eq(Date.today)
      end
    
      it "should assign entries" do
        assigns(:entries).should eq([mock_entry, mock_entry])
      end
    
      it "should assign new_entry" do
        assigns(:entry).should eq(mock_entry)
      end
    end
    
    context "when a date is specified" do
      before(:each) do
        Entry.should_receive(:for_date).with(Date.yesterday) { [mock_entry, mock_entry] }
      
        get 'index', :date => Date.yesterday.to_s
      end
      
      it "should retrieve entries for that date" do
        assigns(:entries).should eq([mock_entry, mock_entry])
      end
      
      it "should assign date to yesterday's date" do
        assigns(:date).should eq(Date.yesterday)
      end
    end
  end
  
  describe "POST 'create'" do  
    context "when no date is specified" do
      it "should redirect to index" do
        valid_entry = mock_entry
        valid_entry.should_receive(:save).and_return(true)
      
        Entry.stub(:new).with({"dummy" => "params"}) { valid_entry }
      
        post :create, :entry => {"dummy" => "params"}
      
        response.should redirect_to(:action => 'index')
      end
      
      it "should set the creation date of the entry to today" do
        valid_entry = mock_entry
        valid_entry.should_receive(:save).and_return(true)
        valid_entry.should_receive(:created=).with(Date.today.to_time(:utc))
      
        Entry.stub(:new).with({"dummy" => "params"}) { valid_entry }
      
        post :create, :entry => {"dummy" => "params"}
      end
    end
    
    context "when a date is specified" do
      it "should redirect to index" do
        valid_entry = mock_entry
        valid_entry.should_receive(:save).and_return(true)
      
        Entry.stub(:new).with({"dummy" => "params"}) { valid_entry }
      
        post :create, :entry => {"dummy" => "params"}, :date => Date.yesterday.to_s
      
        response.should redirect_to(:action => 'index', :date => Date.yesterday.to_s)
      end
      
      it "should set the creation date of the entry to the specified date" do
        valid_entry = mock_entry
        valid_entry.should_receive(:save).and_return(true)
        valid_entry.should_receive(:created=).with(Date.yesterday.to_time(:utc))
      
        Entry.stub(:new).with({"dummy" => "params"}) { valid_entry }
      
        post :create, :entry => {"dummy" => "params"}, :date => Date.yesterday.to_s
      end
    end
  end
end
