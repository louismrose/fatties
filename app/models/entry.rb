class Entry
  include Mongoid::Document
  field :name, :type => String
  field :points, :type => Float
  field :created, :type => Date
  
  def self.today
    where(:created => Time.now.utc.midnight)
  end
end
