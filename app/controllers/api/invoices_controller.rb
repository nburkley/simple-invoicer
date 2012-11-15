class Api::InvoicesController < ApplicationController
  respond_to :json

  def index
    @invoices = current_user.invoices
    respond_with @invoices
  end

  def show
    @invoice = current_user.invoices.find(params[:id])
  end

  def destroy
    @invoice = current_user.invoices.find(params[:id])
    if @invoice.destroy.destroyed?
      head :no_content
    else
      render :json => {:errors => @invoice.errors}, :status => :unprocessable_entity
    end
  end

end