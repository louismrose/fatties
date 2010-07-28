Feature: Manage trackers
  In order to lose weight
  As a fatty
  I want to track the food I eat

Scenario: Add to the tracker
  Given I am on the tracker page
  When I fill in "Food" with "Apple"
  And  I fill in "Points" with "0.5"
  And  I press "Add"
  Then I should be on the tracker page
  And  I should see "Apple"
  And  I should see "0.5"  