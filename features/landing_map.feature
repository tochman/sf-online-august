@javascript
Feature: As a Customer
  in order to see restaurants in my area
  I need to see a map and list with local restaurants.

  Background:
    Given the following users exist
      | name  | email         | role  |
      | Anna  | anna@food.se  | owner |
      | Janne | janne@food.se | owner |

    And the following restaurants exists
      | name | description | zipcode | owner  | category |
      | McD  | Nice food   | 41463   | Anna   | Pizza    |
      | McF  | Nice food   | 41677   | Janne  | Pizza    |
      | Jam  | Jam  food   | 41509   | Henrik | Thai     |
    And I am on the "index" page
    And my location is set to "57.7088700" lat and "11.9745600" lng
    And the map has been loaded


  Scenario: Viewing my location on the map
    Then the center of the map should be approximately "57.7088700" lat and "11.9745600" lng

  Scenario: Viewing the restaurants on the map
    Given I select "All Restaurants" from "category"
    Then I should see "3" markers

  Scenario: Viewing restaurants on the map by category
    Given I select "Pizza" from "category"
    Then I should see "2" markers


  Scenario: Clicking on marker displays info box
    Given I select "Thai" from "category"
    And the map has been loaded
    And I click on the marker for "Jam"
    Then I should see an info window for "Jam"

