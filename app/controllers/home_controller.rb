class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @invoices = current_user.invoices
      render 'index'
    else
      render 'logged_out_home'
    end
  end
end