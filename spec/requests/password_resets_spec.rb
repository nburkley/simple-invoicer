require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path
    click_link 'password'
    within(".forgot-password-form") do
      fill_in "Email", :with => user.email
    end
    click_button "reset password"
    page.should have_content "You will receive an email"
    current_email = open_last_email_for(user.email)
    current_email.should have_subject(/Reset password instructions/)
  end
end
