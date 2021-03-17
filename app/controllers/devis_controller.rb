class DevisController < ApplicationController
  before_action :authenticate_user!
  before_action :set_devi, only: %i[ show edit update destroy ]

  # GET /devis or /devis.json
  def index
    @devis = current_user.devis
  end

  # GET /devis/1 or /devis/1.json
  def show
    @produit = @devi.produits.build
  end

  # GET /devis/new
  def new
    @devi = current_user.devis.build
  end

  # GET /devis/1/edit
  def edit
  end

  # POST /devis or /devis.json
  def create
    @devi = current_user.devis.build(devi_params)

    respond_to do |format|
      if @devi.save
        format.html { redirect_to @devi, notice: "Le devis a bien été créé." }
        format.json { render :show, status: :created, location: @devi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @devi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devis/1 or /devis/1.json
  def update
    respond_to do |format|
      if @devi.update(devi_params)
        format.html { redirect_to @devi, notice: "Le devis a bien été modifié." }
        format.json { render :show, status: :ok, location: @devi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @devi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devis/1 or /devis/1.json
  def destroy
    @devi.destroy
    respond_to do |format|
      format.html { redirect_to devis_url, notice: "Le devis a été supprimé." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devi
      @devi = current_user.devis.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def devi_params
      params.require(:devi).permit(:decorateur, :nom, :prenom, :email, :telephone, :adresse, :numero)
    end
end
