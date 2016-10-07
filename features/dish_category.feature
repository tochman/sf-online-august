Feature: As a restaurant owner
  in order to clarify my menu
  I need to be able to categorize my dishes

  Background:
    Given I am logged in as a restaurant owner
    And I already have a restaurant
    And I have the following menus:
      | title |
      | Lunch |

  Scenario: I categorize my dish
    Given I am on the "Create Dish" page
    Then I select "Starters" from "Category"
    Then show me the page
