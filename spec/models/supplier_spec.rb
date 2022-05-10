require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when registration number is empty' do
        supplier = Supplier.create(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '', full_address: 'Avenida aeroporto, 1000', email: 'philipe-leandro@hotmail.com', phone: '88996268196')

        expect(supplier.valid?).to eq false
      end

      it 'false when phone number is empty' do
        supplier = Supplier.create(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '1234567891234', full_address: 'Avenida aeroporto, 1000', email: 'philipe-leandro@hotmail.com', phone: '')

        expect(supplier.valid?).to eq false
      end
    end

    context 'uniq' do
      it 'false when registration_number is already in use' do
        supplier_first = Supplier.create(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'test@example.com', phone: '88000002222')

        supplier_second = Supplier.create(corporate_name: 'Testing LTDA', brand_name: 'Testing', city: 'São Paulo', state: 'São Paulo', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 100', email: 'testing@example.com', phone: '88900002222')

        expect(supplier_second.valid?).to eq false
      end
    end
  
    context 'format' do
      it 'registration number must have only numbers' do
        supplier = Supplier.create(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '123456789789a', full_address: 'Avenida aeroporto, 1000', email: 'test@example.com', phone: '88000002222')

        expect(supplier.valid?).to eq false
      end

      it 'registration number must have 13 digits' do
        supplier_first = Supplier.create(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '123456789789', full_address: 'Avenida aeroporto, 1000', email: 'test@example.com', phone: '88000002222')
        supplier_second = Supplier.create(corporate_name: 'Testing LTDA', brand_name: 'Testing', city: 'São Paulo', state: 'São Paulo', registration_number: '12345678912314', full_address: 'Avenida aeroporto, 100', email: 'testing@example.com', phone: '88900002222')

        expect(supplier_first.valid?).to eq false
        expect(supplier_second.valid?).to eq false
      end
    end
  end
end
