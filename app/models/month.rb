class Month
  attr_reader :start
  
  def initialize(date)
    @start = date.beginning_of_month
  end
  
  def name
    start.strftime("%B %Y")
  end
  
  def each_tracker(&block)
    dates.each do |date|
      yield date, Tracker.new(date)
    end
  end
  
  def trackers
    dates.map { |date| Tracker.new(date) }
  end
  
private
  def dates
    [].tap do |trackers|
      current = @start
      while current <= @start.end_of_month
        trackers << current
        current = current.tomorrow
      end
    end
  end
end