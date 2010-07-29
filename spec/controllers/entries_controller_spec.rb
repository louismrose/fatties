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
    
      it "should assign entries" do
        assigns(:entries).should eq([mock_entry, mock_entry])
      end
    
      it "should assign new_entry" do
        assigns(:entry).should eq(mock_entry)
      end
    end
    
    context "when a date is specified" do
      it "should retrieve entries for that date" do
        Entry.should_receive(:for_date).with(Date.yesterday) { [mock_entry, mock_entry] }
      
        get 'index', :date => Date.yesterday
        
        assigns(:entries).should eq([mock_entry, mock_entry])
      end
    end
  end
  
  describe "POST 'create'" do    
    it "should redirect to index" do
      valid_entry = mock_entry
      valid_entry.should_receive(:save).and_return(true)
      
      Entry.stub(:new).with({"dummy" => "params"}) { valid_entry }
      
      post :create, :entry => {"dummy" => "params"}
      
      response.should redirect_to(:action => 'index')
    end
  end
end
