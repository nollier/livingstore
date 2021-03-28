class RemoveDeviReferenceFromProduits < ActiveRecord::Migration[6.0]
  def change
    remove_reference :produits, :devi, index: true, foreign_key: true
  end
end
