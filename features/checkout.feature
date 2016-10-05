Feature: As a restaurant owner
  in order to get some money
  I need customers to pay on checkout.

Background:
  Given the following owners exist:
    | name   | email           |
    | Anna   | anna@random.com |
  And "Anna" has a restaurant
  And "Anna" has the following dishes:
    | title | price |
    | Pizza | 70    |
    | Salad | 65    |

Scenario: I sign up for my paid membership
  Given I am logged in as as customer
  And I am on the dish page for "Pizza"
  And I click the "Add to Cart" button
  When I click the link "Pay Now"
  Then I should see "Total: 135"
  And I fill in appropriate card details
