class Entry
  include Mongoid::Document
  field :name, :type => String
  field :points, :type => Float
end
