class AddProduitReferencesFromDevis < ActiveRecord::Migration[6.0]
  def change
    add_reference :devis, :produit, index: true, foreign_key: true
  end
end
