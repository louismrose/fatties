module TrackersHelper
  def month_for(date)
    [].tap do |dates|
      current = date.beginning_of_month
      while current <= date.end_of_month
        dates << current
        current = current.tomorrow
      end
    end
  end
end
