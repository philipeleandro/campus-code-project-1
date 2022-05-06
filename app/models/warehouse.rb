class Warehouse < ApplicationRecord
  validates :name, :description, :code, :address, :city, :cep, :area, presence: true
  validates :name, :code, uniqueness: true
  validates :cep, format: { with: /[0-9]{5}-[0-9]{3}/ }
end
