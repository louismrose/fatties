Given /^the date is "([^"]*)"$/ do |date_string|
  Timecop.freeze Chronic.parse("#{date_string} at noon")
end
