Feature: As a restaurant Owner
  in order to show more menu details
  I need to have a Menu page for each Menu.

Background:
  Given the following dishes exist
    | dish_name | dish_desc       | dish_price |
    | Pizza     | Delicious pizza | 7000       |
    | Salad     | Leafy           | 1500       |
    | Olives    | Salty           | 900        |
  And the following menus exist:
    | title |
    | Lunch |
  And I add "Pizza" to the "Lunch" menu

Scenario: I view the menu
  Given I am on the menu page for "Lunch"
  When I click the link "Pizza"
  Then I should be on the dish page for "Pizza"
