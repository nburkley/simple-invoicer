require 'email_spec/cucumber'

Given /^there are no users$/ do
  User.count == 0
end

When /^I sign up$/ do
  visit '/'
  click_link("Sign Up")
  within(".signup-form") do
    fill_in "Email", :with => default_email_address
    fill_in "Password", :with => 'password'
    fill_in "Password Confirmation", :with => 'password'
    click_button "Sign up"
  end
end

Then /^I should see a signup confirmation message$/ do
  page.should have_content("A message with a confirmation link has been sent to your email address")
end

Then /^I should receive a signup confirmation email$/ do
  unread_emails_for(default_email_address).size.should == 1
  current_email = open_email(default_email_address)
  current_email.should have_subject(/Confirmation instructions/)
end

When /^I follow the signup confirmation link$/ do
  visit_in_email('Confirm my account')
end

Then /^I should be logged in$/ do
  page.should have_content("Logged in as")
end

Given /^I am signed up$/ do
  user = current_user
end

When /^I sign in$/ do
  pending # express the regexp above with the code you wish you had
end

module UserHelpers
  def default_email_address
    last_email_address || "example@example.com"
  end

  def current_user
    if !@current_user
      @current_user = FactoryGirl.create(:user, :password => 'password')
      FactoryGirl.create(:goal, :user => @current_user)
    end
    @current_user.reload
  end

end

World(UserHelpers)