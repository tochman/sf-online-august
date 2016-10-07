Feature: As a visitor
  in order to check out or rate restaurants
  I need to be able to register as a Customer.

Scenario: I register as a Customer
  Given there are "0" users in the system
  And I am on the "register" page
  Then show me the page
  Then I should see "Sign up as Customer"
  When I fill in:
    | element                    | content          |
    | Name                       | Julie            |
    | Email                      | julie@random.com |
    | Address                    | Fjällgatan 3, Göteborg, Västa Götaland, Sverige |
    | Password                   | password         |
    | Password confirmation      | password         |
  When I click the "Register" button
  Then there should be "1" user in the system

Scenario: Redirects to restaurant index page after registration
  Given I register as a user with username "Amber" and email "amber@random.com"
  Then I should be on the "index" page
  And I should see "Amber"

Scenario: I log out
  Given I am logged in as a user
  And I am on the "index" page
  When I click the link "Logout"
  Then I should be on the "index" page
  And I should see "Signed out successfully"

Scenario: Gives you an error when you register without name
  Given I register as a user with username "" and email "amber@random.com"
  Then I should be on the "user registration" page
  And I should see "Name can't be blank"
  Then there should be "0" users in the system

Scenario: Gives you an error when you register without email
  Given I register as a user with username "Jesper" and email ""
  Then I should be on the "user registration" page
  And I should see "Email can't be blank"
  Then there should be "0" users in the system

Scenario: Gives you an error when you register without address
  Given I register as a user with address ""
  Then I should be on the "user registration" page
  And I should see "Address can't be blank"
  Then there should be "0" users in the system
