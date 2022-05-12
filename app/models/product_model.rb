class ProductModel < ApplicationRecord
  belongs_to :supplier

  validates :name, :weigth, :width, :height, :depth, :sku, presence: true
  validates :sku, uniqueness: true
  validates :weigth, :width, :height, :depth, numericality: { greater_than: 0 }
  validates :sku, format:  { with: /[A-Z0-9]{20}/ }
  validates :sku, length: { is: 20 }
end
