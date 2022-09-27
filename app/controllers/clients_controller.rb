class ClientsController < ApplicationController

  def index
    @clients = policy_scope(Client.all)
    # authorize @clients
    @clients = @clients.where("#{params[:search]} ILIKE ?", "#{params[:query]}%") if params[:query].present?
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "clients/list", locals: { clients: @client }, formats: [:html] }
    end
  end

  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    authorize @client
    if @client.save
      redirect_to clients_path
    else
      puts @client.errors.messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @client = Client.find(params[:id])
    authorize @client
  end

  def update
    @client = Client.find(params[:id])
    authorize @client
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :new, status: { clients: client }
    end
  end

  def show
    @client = Client.find(params[:id])
    authorize @client
  end

  def destroy
    @client = Client.find(params[:id])
    authorize @client
    if @client.destroy
      redirect_to clients_path
    else
      render :new, status: { clients: client }
    end
  end

  private

  def client_params
    params.require(:client).permit(:prenom, :nom, :adresse, :cp, :ville, :pays, :telephone_fixe, :telephone_portable,
                                    :email)
  end
end
