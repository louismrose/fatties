Feature: Track a favourite food
  In order to fill in my tracker more quickly
  As a fatty
  I want to be able to add my favourite foods without typing them in

# TODO - this should specify that Apple must appear before Toast
  Scenario: See a list of favourite foods
    Given the following entries exist:
      | name   | points | created    |
      | Apple  | 0.5    | 3.days.ago |
      | Apple  | 0.5    | 2.days.ago |
      | Apple  | 0.5    | 1.day.ago  |
      | Toast  | 3      | 3.days.ago |
      | Toast  | 3      | 2.days.ago |
    And I am on the tracker page
    Then I should see "Apple"  
    And  I should see "Toast"

  @selenium
  Scenario: Track a favourite food
    Given the following entries exist:
      | name   | points | created    |
      | Apple  | 0.5    | 3.days.ago |
      | Apple  | 0.5    | 2.days.ago |
      | Apple  | 0.5    | 1.day.ago  |
      | Toast  | 3      | 3.days.ago |
      | Toast  | 3      | 2.days.ago |
    And I am on the tracker page
    When I follow "Apple"
    Then the "Food" field should contain "Apple"
    And  the "Points" field should contain "0.5"