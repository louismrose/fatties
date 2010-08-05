class Entry
  include Mongoid::Document
  field :name, :type => String
  field :points, :type => Float
  field :created, :type => Date
  
  def self.find_by_date(date)
    where(:created => date.to_time(:utc))
  end
  
  def self.favourites
    entries_grouped_by_name_and_sorted_by_popularity.map { |group| group.first }
  end
  
private
  def self.entries_grouped_by_name_and_sorted_by_popularity
    entries_grouped_by_name.sort_by { |group| -group.size }[0, 5]
  end

  def self.entries_grouped_by_name
    Entry.only(:name).group.map { |pair| pair["group"] }
  end
end
