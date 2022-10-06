class DocumentsController < ApplicationController
  def show
    @document = Document.find(params[:id])
    authorize @document
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    @document.client_id = params[:client_id]
    @document.montant = 0.0
    @document.types = 0
    @document.statut = 0
    authorize @document
    if @document.save
      redirect_to client_path(params[:client_id])
    else
      puts @document.errors.messages
      # render :new, status: :unprocessable_entity
    end
  end

  def index
    @documents = policy_scope(Document.all)
    # @documents = @documents.where("#{params[:search]} ILIKE ?", "#{params[:query]}%") if params[:query].present?
    # respond_to do |format|
    #   format.html # Follow regular flow of Rails
    #   format.text { render partial: "clients/list", locals: { clients: @client }, formats: [:html] }
    # end
  end

  private

  def document_params
    params.require(:document).permit(:type, :statut, :commentaire, :user_id, :client_id, :montant, :designation)
  end
end
