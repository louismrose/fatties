require 'spec_helper'

describe EntriesController do

  def mock_tracker(stubs={})
    @mock_tracker ||= mock_model(Tracker, stubs).as_null_object
  end

  describe "GET 'index'" do
    context "when the entry mode is not specified" do 
      before(:each) do
        @date = Date.today

        Tracker.stub(:from_s).with(@date.to_s) { mock_tracker }
        mock_tracker.stub(:entries) {["dummy", "entries"]}
      
        get 'index', :tracker_id => @date.to_s
      end
  
      it "should assign tracker to the tracker for the specified date" do
        assigns(:tracker).should eq(mock_tracker)
      end
    
      it "should assign entries from the tracker" do
        assigns(:entries).should eq(["dummy", "entries"])
      end
    
      it "should assign points as the entry mode" do
        assigns(:entry_mode).should == :points
      end
  
      it "should be successful" do
        response.should be_success
      end
  
      it "should render the index template" do
        response.should render_template('index')
      end
    end
    
    context "when the entry mode is specified" do
      it "should assign the entry mode" do
        @entry_mode = "nutritional"
        Tracker.stub(:from_s) { mock_tracker }
        get 'index', :tracker_id => 1, :entry_mode => @entry_mode 

        assigns(:entry_mode).should == @entry_mode.to_sym
      end
    end
  end
  
  describe "POST 'create'" do  
    context "when HTML request" do
      before (:each) do
        @date = Date.today
      
        Tracker.stub(:from_s).with(@date.to_s) { mock_tracker }
        mock_tracker.should_receive(:create_entry).with({"dummy" => "params"})
      
        post :create, :tracker_id => @date.to_s, :entry => {"dummy" => "params"}
      end
    
      it "should assign tracker to the tracker for the specified date" do
        assigns(:tracker).should eq(mock_tracker)
      end
    
      it "should redirect to the index action" do
        response.should redirect_to(:action => 'index')
      end
    end
    
    context "when JS request" do
      before (:each) do
        @date = Date.today
      
        Tracker.stub(:from_s).with(@date.to_s) { mock_tracker }
        mock_tracker.should_receive(:create_entry).with({"dummy" => "params"}) { "dummy_entry" }
        
        mock_tracker.stub(:entries) {["dummy", "entries"]}
        
      
        xhr :post, :create, :tracker_id => @date.to_s, :entry => {"dummy" => "params"}
      end
    
      it "should assign tracker to the tracker for the specified date" do
        assigns(:tracker).should eq(mock_tracker)
      end
      
      it "should assign entry to the newly created entry" do
        assigns(:entry).should eq("dummy_entry")
      end
      
      it "should assign entries from the tracker" do
        assigns(:entries).should eq(["dummy", "entries"])
      end
    
      it "should render the create template" do
        response.should render_template('create')
      end
    end
  end
end
