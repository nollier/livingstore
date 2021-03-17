class Devi < ApplicationRecord
  has_many :produits, dependent: :destroy
  belongs_to :user
end
