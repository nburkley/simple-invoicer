class ClientsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_client, :only => [:edit, :update, :destroy]

  def index
    @clients = current_user.clients
  end

  def new
    @client = Client.new
    @client.build_address
    @client.contacts.build
  end

  def create
    @client = Client.new(params[:client])
    @client.user = current_user
    if @client.save
      redirect_to clients_path, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @client.update_attributes(params[:client])
    if @client.save
      redirect_to edit_client_path(@client), notice: "Client updated!"
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url
  end

  protected
    def find_client
      @client = current_user.clients.find(params[:id])
    end
end