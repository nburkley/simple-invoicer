class InvoicesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @invoices = current_user.invoices
  end

  def show
    @invoice = current_user.invoices.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf  {
        render :pdf => "invoice-#{@invoice.number}",
          :template => '/invoices/show.html',
          :layout => 'pdf.html'
      }
    end
  end

  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
    @invoice.number = Invoice.next_number_for_user(current_user)
  end


  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.user = current_user
    if @invoice.save
      redirect_to @invoice, notice: "Invoice was successfully created."
    else
      render :new
    end
  end

  def edit
    @invoice = current_user.invoices.find(params[:id])
  end

  def update
    @invoice = current_user.invoices.find(params[:id])
    @invoice.update_attributes(params[:invoice])
    if @invoice.save
      redirect_to @invoice, notice: "Invoice was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @invoice = current_user.invoices.find(params[:id])
    @invoice.destroy

    redirect_to invoices_url
  end
end
