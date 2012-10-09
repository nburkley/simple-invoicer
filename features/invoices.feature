Feature: Invoices
  A user can view add and delete a collection of invoices

Scenario: View list of invoices
  Given I am signed up
  And I have 2 invoices
  And I am logged in
  Then I should see a list of my invoices

Scenario: View an invoice
  Given I am signed up
  And I have 1 invoice
  And I am logged in
  Then I can view invoice number 1

Scenario: Delete an invoice
  Given I am signed up
  And I have 2 invoices
  And I am logged in
  When I delete an invoice
  Then I should have 1 invoice

Scenario: Create an invoice
  Given I am signed up
  And I have 2 invoices
  And I have 1 client
  And I am logged in
  When I create a new invoice
  Then I should have 3 invoices

Scenario: Update an invoice
  Given I am signed up
  And I have 1 client
  And I have 1 invoice
  And I am logged in
  When I update invoice number 1
  Then I can view invoice number 1
  And I can see the new invoice information