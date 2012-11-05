class Api::UsersController < ApplicationController

  respond_to :json

  def show
    @user = current_user
  end

end
