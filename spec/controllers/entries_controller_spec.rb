require 'spec_helper'

describe EntriesController do

  describe "GET 'index'" do
    # before(:each) do
    #   get 'index'
    # end
    
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should assign entries" do
      entries = [mock_model(Entry), mock_model(Entry)]
      Entry.should_receive(:all).and_return(entries)
      
      get 'index'
      
      assigns(:entries).should eq(entries)
    end
    
    it "should assign new_entry" do
      entry = mock_model(Entry)
      Entry.should_receive(:new).and_return(entry)
      
      get 'index'
      
      assigns(:entry).should eq(entry)
    end
  end
  
  describe "POST 'create'" do
    it "should be successful when save suceeds" do
      entry = mock_model(Entry, :to_param => "1")
      Entry.should_receive(:save).and_return(true)
      
      post :create, :entry => entry
    end
  end
end
