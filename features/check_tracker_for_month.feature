Feature: Track points for month
  In order to lose weight
  As a fatty
  I want an overview of my points
  
  Scenario: See points for this month
    Given the date is "3 July 2010" 
    And   23 points were logged on "1 July 2010"
    And   24 points were logged on "2 July 2010"
    And   5.5 points were logged on "3 July 2010"
    And   I am on the trackers page
    Then  I should see "July 2010"
    And   I should see 23 points on "1 July 2010"
    And   I should see 24 points on "2 July 2010"
    And   I should see 5.5 points on "3 July 2010"
  