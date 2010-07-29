class Entry
  include Mongoid::Document
  field :name, :type => String
  field :points, :type => Float
  field :created, :type => Date
  
  def self.for_date(date)
    where(:created => date.to_time(:utc))
  end
end
