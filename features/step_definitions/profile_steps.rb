When /^I view my profile page$/ do
  visit '/profile'
end

Then /^I should see my correct profile details$/ do
  find_field('profile_company_name').value.should eq(current_user.profile.company_name)
end

When /^I update my profile$/ do
  fill_in "profile_company_name", :with => "Initech"
  click_button "Update Profile"
end