@wip
Feature: Track points for month
  In order to lose weight
  As a fatty
  I want an overview of my points
  
  Scenario: See points for this month
    Given the date is "28 July 2010" 
    And   I am on the trackers page
    Then  I should see "July 2010"
    And   I should see "1"
    And   I should see "28"
    And   I should see "31"
  