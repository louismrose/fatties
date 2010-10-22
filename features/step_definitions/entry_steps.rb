Given /^the following entries exist:$/ do |table|
  table.hashes.each do |row|
    row['created'] = eval(row['created']).utc
    Entry.new(row).save
  end
end

Given /^([\d|.]+) points were logged on "([^"]*)"$/ do |points, date|
  Entry.create(:name => 'FakeEntry',
               :points => points,
               :created => Chronic.parse(date).utc)
end
