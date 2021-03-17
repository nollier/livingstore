class CreateDevis < ActiveRecord::Migration[6.0]
  def change
    create_table :devis do |t|
      t.string :decorateur
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      t.string :adresse
      t.string :numero
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
