class Product < ApplicationRecord
  validates :title, :description, :price, :quantity, presence: true
  validates :price, numericality: { greater_than: 0}

end
