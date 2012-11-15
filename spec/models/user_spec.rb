require 'spec_helper'

describe User do
  describe "#send_password_reset_instructions" do
    let(:user) { FactoryGirl.create(:user) }

    it "generates a unique password_reset_token each time" do
      user.send_reset_password_instructions
      last_token = user.reset_password_token
      user.send_reset_password_instructions
      puts ("last_token: #{last_token}, new_token: #{user.reset_password_token}")
      user.reset_password_token.should_not eq(last_token)
    end
  end
end