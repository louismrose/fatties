Then /^I should see ([\d|.]+) points on "([^"]*)"$/ do |points, date|
  date = Chronic.parse(date).to_date.to_s
  
  find(:css, '#' + date).text.should =~ /#{points}/
end

