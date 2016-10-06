Feature: As a restaurant owner
  in order to get some money
  I need customers to pay on checkout.

Background:
  Given I am logged in as a user
  And I have dishes in my order

Scenario: I do checkout
  Given I am on the "cart" page
  When I click the link "Pay Now"
  #Then I should see "Total: 135"
  And I fill in appropriate card details
