class Supplier < ApplicationRecord
  validates :corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email, :phone, presence: true
  validates :registration_number, uniqueness: true
  validates :registration_number, format: { with: /[0-9]{13}/ }
  validates :registration_number, length: { is: 13}
end
