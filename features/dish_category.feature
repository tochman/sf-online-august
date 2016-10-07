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


  Scenario: View dishes by category
    Given there is a dish named "Starter 1" with category "Starters" for menu "Lunch"
    And there is a dish named "Starter 2" with category "Starters" for menu "Lunch"
    And there is a dish named "Main 1" with category "Mains" for menu "Lunch"
    And there is a dish named "Dessert 1" with category "Desserts" for menu "Lunch"
    And I am on the menu page for "Lunch"
    Then I should see "Starter 1" within "Starters"
    And I should see "Starter 2" within "Starters"
    And I should see "Main 1" within "Mains"
    And I should see "Dessert 1" within "Desserts"