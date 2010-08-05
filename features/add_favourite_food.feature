Feature: Track a favourite food
  In order to fill in my tracker more quickly
  As a fatty
  I want to be able to add my favourite foods without typing them in

  Scenario: See a list of favourite foods
    Given the following entries exist:
      | name   | points | created    |
      | Apple  | 0.5    | 3.days.ago |
      | Apple  | 0.5    | 2.days.ago |
      | Apple  | 0.5    | 1.day.ago  |
      | Toast  | 3      | 3.days.ago |
      | Toast  | 3      | 2.days.ago |
    And I am on the tracker page
    Then the "favourites" list should contain "Apple" then "Toast"
    
  Scenario: See a list limited to top 5 favourite foods
    Given the following entries exist:
      | name   | points | created    |
      | Apple  | 0.5    | 2.days.ago |
      | Apple  | 0.5    | 2.days.ago |
      | Banana | 2      | 2.days.ago |
      | Banana | 2      | 2.days.ago |
      | Grapes | 1      | 2.day.ago  |
      | Grapes | 1      | 2.day.ago  |
      | Mango  | 3      | 2.days.ago |
      | Mango  | 3      | 2.days.ago |
      | Pear   | 1.5    | 2.days.ago |
      | Pear   | 1.5    | 2.days.ago |
      | Kiwi   | 3      | 2.days.ago |
    And I am on the tracker page
    Then I should see "Apple" within "#favourites"
    And  I should see "Banana" within "#favourites"
    And  I should see "Grapes" within "#favourites"
    And  I should see "Mango" within "#favourites"
    And  I should see "Pear" within "#favourites"
    And  I should not see "Kiwi" within "#favourites"

  @javascript
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