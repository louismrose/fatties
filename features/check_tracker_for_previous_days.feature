Feature: Track today's food
  In order to lose weight
  As a fatty
  I want to check how much food I've eaten in the past
  
  Scenario: Check the food I ate and my total points yesterday
    Given the following entries exist:
      | name   | points | created   |
      | Salad  | 3      | 1.day.ago |
      | Burger | 20     | 1.day.ago |
    When I am on the tracker page for yesterday
    Then I should see "Salad" within the tracker
    And  I should see "Burger" within the tracker
    And  I should see "23" within the tracker
    
  Scenario: See yesterday's date on yesterday's tracker
    Given the date is "28 July 2010"
    When I am on the tracker page for yesterday
    Then I should see "27 July 2010"
  
  Scenario: Add an entry to the tracker that I forgot
    Given the date is "28 July 2010"
    And   I am on the tracker page for yesterday
    When I fill in "Food" with "Apple"
    And  I fill in "Points" with "0.5"
    And  I press "Add"
    Then I should see "27 July 2010"
    And  I should see "Apple" within the tracker
    And  I should see "0.5" within the tracker
  
