class Api::CurrencyTypesController < ApplicationController

  respond_to :json

  def index
    @currency_types = CurrencyType.all
  end

end
