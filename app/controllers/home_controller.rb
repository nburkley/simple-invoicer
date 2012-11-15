class HomeController < ApplicationController
  def index
    if user_signed_in?
      @current_user = current_user
      @invoices = current_user.invoices
      @currency_types = CurrencyType.all
      render 'index'
    else
      render 'logged_out_home'
    end
  end
end