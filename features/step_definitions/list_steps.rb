Then /^the "([^"]*)" list should contain "([^"]*)" then "([^"]*)"$/ do |list, first, second|
  with_scope('#' + list) do
    all('li').size.should == 2
    all('li').first.text.should  == first
    all('li').second.text.should == second
  end
end
