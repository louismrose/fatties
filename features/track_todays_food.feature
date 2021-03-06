Feature: Track today's food
  In order to lose weight
  As a fatty
  I want to track the food that I eat today

  @javascript
  Scenario: Add to the tracker using Fatties points
    Given I am on the tracker page
    When I fill in "Food" with "Apple"
    And  I fill in "Points" with "0.5"
    And  I press "Add"
    Then I should be on the tracker page
    And  I should see "Apple" within the tracker
    And  I should see "0.5" within the tracker

  @javascript
  Scenario: Add to the tracker using nutritional information
    Given I am on the tracker page
    When  I follow "Nutritional"
    And   I fill in the following:
           | Food         | Muesli |
           | Carbohydrate | 63.9   |
           | Protein      | 6.8    |
           | Fat          | 2.5    |
           | Fibre        | 7.7    |
    And   I press "Add"
    Then  I should be on the tracker page
    And   I should see "Muesli" within the tracker
    And   I should see "8" within the tracker
  
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
    Then I should see "Apple" within the tracker
    And  I should not see "Banana" within the tracker
    And  I should not see "Pear" within the tracker
    
  Scenario: See the total points for today's entries
   Given the following entries exist:
     | name   | points | created        |
     | Toast  | 3      | 3.minutes.ago  |
     | Apple  | 0.5    | 2.minutes.ago  |
     | Banana | 1      | 1.minute.ago   |
   When I am on the tracker page
   Then I should see "4.5" within the tracker