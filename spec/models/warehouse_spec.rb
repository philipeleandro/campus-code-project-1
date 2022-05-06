require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do 
      it 'false when name is empty?' do
      # Arrange
        warehouse = Warehouse.new(name: '', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Avenida aeroporto, 1000', cep: '20000-000', description: 'Galpão do Rio')
        
      # Act
      result = warehouse.valid?

      # Assert
      expect(result).to eq false
      end

      it 'false when code is empty?' do
        # Arrange
          warehouse = Warehouse.new(name: 'Rio', code: '', city: 'Rio de Janeiro', area: 60_000, address: 'Avenida aeroporto, 1000', cep: '20000-000', description: 'Galpão do Rio')
          
        # Act
        result = warehouse.valid?
    
        # Assert
        expect(result).to eq false
      end


      it 'false when address is empty?' do
        # Arrange
          warehouse = Warehouse.new(name: 'Rio', code: '', city: 'Rio de Janeiro', area: 60_000, address: '', cep: '20000-000', description: 'Galpão do Rio')
          
        # Act
        result = warehouse.valid?
    
        # Assert
        expect(result).to eq false
      end
    end

    context 'uniq' do
      it 'false when code is already in use' do
        # Arrange
          warehouse_first = Warehouse.create(name: 'Rio', code: 'RIO', city: 'Rio de Janeiro', area: 60_000, address: 'Avenida aeroporto, 1000', cep: '20000-000', description: 'Galpão do Rio')
          warehouse_second = Warehouse.create(name: 'Niteroi', code: 'RIO', city: 'Niteroi', area: 50_000, address: 'Avenida aeroporto, 1200', cep: '20000-000', description: 'Galpão novo')
          
        # Act
        result = warehouse_second.valid?
    
        # Assert
        expect(result).to eq false
      end

      it 'false when name is already in use' do
        # Arrange
          warehouse_first = Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Avenida aeroporto, 1000', cep: '80000-000', description: 'Galpão do Maceió')
          warehouse_second = Warehouse.create(name: 'Maceio', code: 'RIO', city: 'Niteroi', area: 50_000, address: 'Avenida aeroporto, 1200', cep: '20000-000', description: 'Galpão novo')
          
        # Act
        result = warehouse_second.valid?
    
        # Assert
        expect(result).to eq false
      end
    end

    context 'format' do
      it 'true when cep is correct' do
        # Arrange
        jua_warehouse = Warehouse.create(name: 'Juazeiro', code: 'JDN', city: 'Juazeiro do Norte', area: 20_000, address: 'Avenida aeroporto, 1500', cep: '63030-000', description: 'Galpão novo')

        # Act

        # Assert
        expect(jua_warehouse.valid?).to eq true
      end

      it 'false when cep is missing a number' do
        # Arrange
        jua_warehouse = Warehouse.create(name: 'Juazeiro', code: 'JDN', city: 'Juazeiro do Norte', area: 20_000, address: 'Avenida aeroporto, 1500', cep: '63030-00', description: 'Galpão novo')
        jua_warehouse_two = Warehouse.create(name: 'Juazeiro', code: 'JDN', city: 'Juazeiro do Norte', area: 20_000, address: 'Avenida aeroporto, 1500', cep: '6303-000', description: 'Galpão novo')


        # Act

        # Assert
        expect(jua_warehouse.valid?).to eq false
        expect(jua_warehouse_two.valid?).to eq false
      end

      it 'false when cep is not only numbers' do
        # Arrange
        jua_warehouse = Warehouse.create(name: 'Juazeiro', code: 'JDN', city: 'Juazeiro do Norte', area: 20_000, address: 'Avenida aeroporto, 1500', cep: '63030-00a', description: 'Galpão novo')
        jua_warehouse_two = Warehouse.create(name: 'Juazeiro', code: 'JDN', city: 'Juazeiro do Norte', area: 20_000, address: 'Avenida aeroporto, 1500', cep: '6303a-000', description: 'Galpão novo')

        # Act

        # Assert
        expect(jua_warehouse.valid?).to eq false
        expect(jua_warehouse_two.valid?).to eq false
      end
    end
  end
end
