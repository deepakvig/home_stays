Feature: Valid Search
  As a user
  I want to seach for rooms availability using valid search params

  Scenario: Search without start and end Date
    Given I am on the homepage
    When I press "Search"
    Then I should see "start_date can't be blank"
    And I should see "end_date can't be blank"

  Scenario: Search with start greater than end Date
    Given I am on the homepage
    And I fill in "search_start_date" with "10-06-2012"
    And I fill in "search_end_date" with "01-06-2012"
    When I press "Search"
    Then I should see "End Date should be greater than Start Date" 
