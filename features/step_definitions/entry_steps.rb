Given /^the following entries exist:$/ do |table|
  table.hashes.each do |row|
    row['created'] = eval(row['created']).utc
    Entry.new(row).save
  end
end
