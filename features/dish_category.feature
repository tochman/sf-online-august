Feature: As a restaurant Owner 
  in order to clarify my menu 
  I need to be able to categorize my dishes  

Background: 
  Given the following owners exist: 
  | name  |       | Edgar | 
  And "Edgar" has a restaurant 
  And "Edgar" has a menu "Fisk"   

Scenario: I categorize my dish 
  Given I am on the menu page for "Fisk" 
  And I am on the "Create Dish" page 
  Then I select "Starter" from "Category"
