class Api::CurrentUsersController < ApplicationController

  respond_to :json

  def show
    @current_user = current_user
  end

end
