Feature: As a restaurant owner
  in order to get some money
  I need customers to pay on checkout.

Background:
  Given I am logged in as a user
  And there is one dish in my cart
@javascript
Scenario: I do checkout
  Given I am on the "cart" page
  When I click the "Pay with Card" stripe button
  #Then show me the page
  #Then I should see "Total: 135"
  And I fill in appropriate card details
