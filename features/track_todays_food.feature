Feature: Track today's food
  In order to lose weight
  As a fatty
  I want to track the food that I eat today

  Scenario: Add to the tracker
    Given I am on the tracker page
    When I fill in "Food" with "Apple"
    And  I fill in "Points" with "0.5"
    And  I press "Add"
    Then I should be on the tracker page
    And  I should see "Apple"
    And  I should see "0.5"
  
  Scenario: See today's date on the tracker
    Given the date is "28 July 2010"
    When I am on the tracker page
    Then I should see "28 July 2010"
  
  Scenario: See today's entries on the tracker
    Given the following entries exist:
      | name   | points | created        |
      | Apple  | 0.5    | 2.minutes.ago  |
      | Banana | 1      | 1.day.ago      |
      | Pear   | 1      | 1.day.from_now |
    When I am on the tracker page
    Then I should see "Apple"
    And  I should not see "Banana"
    And  I should not see "Pear" 
    
  Scenario: See the total points for today's entries
   Given the following entries exist:
     | name   | points | created        |
     | Toast  | 3      | 3.minutes.ago  |
     | Apple  | 0.5    | 2.minutes.ago  |
     | Banana | 1      | 1.minute.ago   |
   When I am on the tracker page
   Then I should see "4.5"