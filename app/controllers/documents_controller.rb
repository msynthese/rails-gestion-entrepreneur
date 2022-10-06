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
    puts(params)
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    @document.client_id = params[:client_id]
    @document.montant = 0.0
    # @document.types = 0
    @document.statut = 0
    authorize @document
    if @document.save
      redirect_to client_document_path(params[:client_id], @document)
      # redirect_to client_path(params[:client_id])
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

  def destroy
    puts(params)
    @document = Document.find(params[:id])
    authorize @document
    if @document.destroy
      flash.alert = "Devis supprimé"
      redirect_to controller: "clients", action: "show"
    else
      flash.alert = "impossible de suprimer le devis"
    end
  end

  private

  def document_params
    params.require(:document).permit(:types, :statut, :commentaire, :user_id, :client_id, :montant, :designation)
  end
end
