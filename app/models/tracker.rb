class Tracker
  extend ActiveModel::Naming
  
  attr_accessor :date
  
  def self.from_s(date_string)
    Tracker.new(Date.parse(date_string))
  end
  
  def initialize(date)
    @date = date
  end
  
  def entries
    Entry.find_by_date(@date)
  end
  
  def create_entry(params)
    entry = Entry.new(params)
    entry.created = @date.to_time(:utc)
    entry.save
  end
  
  def to_param
    @date.to_s
  end
  
  def ==(other)
    if other.equal?(self)
      return true
    elsif !self.class.equal?(other.class)
      return false
    end

    other.date == date
  end
end
