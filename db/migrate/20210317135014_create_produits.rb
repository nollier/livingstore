class CreateProduits < ActiveRecord::Migration[6.0]
  def change
    create_table :produits do |t|
      t.string :fabricant
      t.string :name
      t.string :element
      t.string :category
      t.string :revetement
      t.integer :price
      t.integer :height
      t.integer :width
      t.integer :deep
      t.references :devi, null: false, foreign_key: true

      t.timestamps
    end
  end
end
