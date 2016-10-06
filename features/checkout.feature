Feature: As a restaurant owner
  in order to get some money
  I need customers to pay on checkout.

  Background:
    Given the following owners exist:
      | name | email             |
      | Anna | anna@fuckhead.com |
    And "Anna" has a restaurant
    Given I am logged in as a user
    And there is one dish in my cart

  @javascript
  Scenario: I do checkout
    Given I am on the "cart" page
    When I click the "Pay with Card" stripe button
    And I fill in appropriate card details
    And I submit the stripe form
    Then I should see "Your food is on its way!"
