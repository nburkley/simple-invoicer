Given /^I have (\d+) invoices?$/ do |number|
  user = current_user
  number.to_i.times do 
    FactoryGirl.create(:invoice, :user=> user)
  end
end

Then /^I should see a list of my invoices$/ do
  current_user.invoices.each do |invoice|
    page.should have_link("#{invoice.number}")
  end
end

Then /^I can view invoice number (\d+)$/ do |invoice_number|
  invoice = current_user.invoices.find_by_number(invoice_number)
  visit invoice_path(invoice)
  formatted_invoice_number = "%07d" % invoice.number
  page.should have_content("#{current_user.profile.company_name}")
  page.should have_content(formatted_invoice_number)
  page.should have_content(invoice.note)
end

When /^I delete an invoice$/ do
  invoice = current_user.invoices.first
  visit invoice_path(invoice)
  click_link "Delete Invoice"
end

Then /^I should have (\d+) invoices?$/ do |number|
  current_user.invoices.count.should == number.to_i
end

Given /^I have (\d+) clients?$/ do |number|
  client = FactoryGirl.create(:client, :user=>current_user)
end

When /^I create a new invoice$/ do
  visit invoices_path()
  click_link "New Invoice"
  select current_user.clients.first.name, :from => "invoice_client_id"
  fill_in "invoice_date", :with => "2012-10-01"
  select CurrencyType.first.label_name, :from => "invoice_currency_type_id"
  click_button "Create Invoice"
end

When /^I update invoice number (\d+)$/ do |number|
  invoice = current_user.invoices.find_by_number(number)
  visit invoice_path(invoice)
  click_link "Edit"
  select current_user.clients.first.name, :from => "invoice_client_id"
  fill_in "invoice_note", :with => "changed note"
  click_button "Update Invoice"
end

Then /^I can see the new invoice information$/ do
  page.should have_content("changed note")
end