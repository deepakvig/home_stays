Feature: Searching Availability
  As a user
  I want to search rooms availability within particular date range

  Background:
    Given I have booking records

  Scenario: Searching available rooms
    When I go to homepage
    And I fill in "search_start_date" with "01-06-2012"
    And I fill in "search_end_date" with "04-06-2012"
    And I press "Search"
    Then I should see a search result "room#1 is available (1 booked, 1 free out of 2 total)"
    And I should see a search result "room#2 is available (0 booked, 1 free out of 1 total)" 
    And I should see a search result "room#3 is available (0 booked, 1 free out of 1 total)" 

  Scenario: Searching available rooms
    When I go to homepage
    And I fill in "search_start_date" with "10-06-2012"
    And I fill in "search_end_date" with "25-06-2012"
    And I press "Search"
    Then I should see a search result "room#3 is available (0 booked, 1 free out of 1 total)"
