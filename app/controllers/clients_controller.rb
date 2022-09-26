class ClientsController < ApplicationController

  def index
    @clients = Client.all
    puts(params)

    @clients = @clients.where("#{params[:search]} ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "clients/list", locals: { clients: @client }, formats: [:html] }
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      puts @client.errors.messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    puts(@client)
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :new, status: { clients: client }
      puts("error update")
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:prenom, :nom, :adresse, :cp, :ville, :pays, :telephone_fixe, :telephone_portable,
                                    :email)
  end
end
