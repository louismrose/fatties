module TrackersHelper
  def dates_in_month_of(date)
    [].tap do |dates|
      current = date.beginning_of_month
      while current <= date.end_of_month
        dates << current
        current = current.tomorrow
      end
    end
  end
end
