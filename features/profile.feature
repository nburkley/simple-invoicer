Feature: Signin
  In order store meaningful invoices
  An existing user can manage their profile

Scenario: Update my profile
  Given I am signed up
  And I am logged in
  When I view my profile page
  Then I should see my correct profile details
  When I update my profile
  Then I should see my correct profile details