Feature: Signin
  In order to access the application
  An existing user can signin
  And a new user can signup

Scenario: New User
  Given there are no users
  When I sign up
  Then I should see a signup confirmation message
  And I should receive a signup confirmation email
  When I follow the signup confirmation link
  Then I should be logged in

Scenario: Existing User
  Given I am signed up
  And I am logged in
  Then I should be logged in