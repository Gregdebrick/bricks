class Product < ApplicationRecord
  has_attachment :photo

  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  validates :brand, presence: true
  validates :tagline, presence: true
  validates :size, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :category, inclusion: { in: %w(Femme Homme Enfant),
    message: "%{value} n'est pas une bonne catégorie" }

end
