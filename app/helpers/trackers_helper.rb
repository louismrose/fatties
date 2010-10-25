module TrackersHelper
  def start_of_week?(date)
    date.monday?
  end
  
  def start_of_month?(date)
    date == date.beginning_of_month
  end
end
