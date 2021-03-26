class ProduitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_devi
  before_action :set_produit, only: [:show, :edit, :update, :destroy]

  # GET devis/1/produits
  def index
    @produits = @devi.produits
  end

  # GET devis/1/produits/1
  def show
  end

  # GET devis/1/produits/new
  def new
    @produit = @devi.produits.build

  end

  # GET devis/1/produits/1/edit
  def edit
  end

  # POST devis/1/produits
  def create
    @produit = @devi.produits.build(produit_params)

    if @produit.save
      redirect_to(@produit.devi, notice: 'Le produit a bien été créé.')
    else
      render action: 'new'
    end
  end

  # PUT devis/1/produits/1
  def update
    if @produit.update_attributes(produit_params)
      redirect_to([@produit.devi, @produit], notice: 'Le produit a bien été ajouté.')
    else
      render action: 'edit'
    end
  end

  # DELETE devis/1/produits/1
  def destroy
    @produit.destroy

    redirect_to devi_produits_url(@devi)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devi
      @devi = current_user.devis.find(params[:devi_id])
    end

    def set_produit
      @produit = @devi.produits.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def produit_params
      params.require(:produit).permit(:fabricant, :name, :element, :category, :revetement, :price, :height, :width, :deep, :devi_id)
    end
end
