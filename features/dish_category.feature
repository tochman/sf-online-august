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
    And I fill in:
      | element          | content              |
      | Dish Name        | Pizza                |
      | Dish description | Delicious pizza      |
      | Price            | 70                   |
    And I click the "Submit" button
    Then I should be on the "dishes" page
    And I should see "Starters"


