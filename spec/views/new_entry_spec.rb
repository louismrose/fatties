require 'spec_helper'
require 'nokogiri'

describe "entries/_new_entry.html.erb" do    
  before(:each) do
    @tracker = mock_model("Tracker")
  end
  
  context "when entry mode is points" do
    before(:each) do
      @entry_mode = :points
      render
    end

    it "must contain fields for entering points by when the entry mode is points" do
      rendered.should have_input_fields_named("entry_name", "entry_points")
    end
    
    it "must indicate that points is the current entry mode" do
      rendered.should have_selector(".current #points")
    end
  end
    
  context "when entry mode is nutritional information" do
    before (:each) do
      @entry_mode = :nutritional
      render
    end
    
    it "must contain fields for entering nutritional information when the entry mode is nutritional" do
      rendered.should have_input_fields_named("entry_name", "carbohydrate", "protein", "fat", "fibre")
    end
    
    it "must indicate that nutritional information is the current entry mode" do
      rendered.should have_selector(".current #nutritional")
    end
  end
end


RSpec::Matchers.define :have_input_fields_named do |*expected|
  match do |actual_html|
    expected.all? do |expected_input_field|
      actual_html.should have_selector("form input##{expected_input_field}")
    end
  end
  
  description do
    "expected a form containing the input fields with the following identifiers #{expected}"
  end
end