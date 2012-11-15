class Api::QuantityTypesController < ApplicationController

  respond_to :json

  def index
    @quantity_types = QuantityType.all
  end

end
