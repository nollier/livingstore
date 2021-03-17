class Devi < ApplicationRecord
  has_many :produits
  belongs_to :user
end
