require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'must have a supplier' do
        pm = ProductModel.new(name: 'Notebook', weigth: 2500, width: 35,height: 23, depth: 20, sku: 'BBCDEFG45125SDASD8D8')

        expect(pm.valid?). to eq false
      end

      it 'false when weight is empty' do
        supplier = Supplier.create(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'test@example.com', phone: '88000002222')

        pm = ProductModel.new(name: 'TV 32', width: 70,height: 45, depth: 10, sku: 'BBCDEFG45125SDASD8D8', supplier: supplier)

        expect(pm.valid?). to eq false     
      end
    end

    context 'uniq' do
      it 'false when sku code is already in use' do
        supplier = Supplier.create!(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'test@example.com', phone: '88000002222')

        pm_one = ProductModel.create(name: 'Notebook', weigth: 2500, width: 35,height: 23, depth: 20, sku: 'BBCDEFG45125SDASD8D8', supplier: supplier)

        pm_two = ProductModel.create(name: 'TV 32', weigth: 8000, width: 70, height: 45, depth: 10, sku: 'BBCDEFG45125SDASD8D8', supplier: supplier)

        expect(pm_two.valid?).to eq false
      end
    end

    context 'format' do
      it 'sku must have 20 digits' do
        supplier = Supplier.create!(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'test@example.com', phone: '88000002222')

        pm_one = ProductModel.create(name: 'Notebook', weigth: 2500, width: 35,height: 23, depth: 20, sku: 'BBCDEFG45125SDASD84', supplier: supplier)

        pm_two = ProductModel.create(name: 'TV 32', weigth: 8000, width: 70, height: 45, depth: 10, sku: 'BBCDEFG45125SDASD8D45', supplier: supplier)        

        expect(pm_one.valid?).to eq false
        expect(pm_two.valid?).to eq false        
      end
    end
  end
end
