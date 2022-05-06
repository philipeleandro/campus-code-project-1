require 'rails_helper'

describe 'User visits homepage' do
  it 'sees app name' do
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end

  it 'sees the registered warehouses' do
    # Arrange
    # Create 2 warehouses: Rio and Maceio
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Avenida aeroporto, 1000', cep: '20000-000', description: 'Galpão do Rio')
    Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Avenida aeroporto, 1000', cep: '80000-000', description: 'Galpão do Maceió')

    # Act
    visit root_path

    # Assert
    expect(page).not_to have_content('Não há galpões cadastrados')
    expect(page).to have_content('Rio')
    expect(page).to have_content('Código: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000m²')

    expect(page).to have_content('Maceio')
    expect(page).to have_content('Código: MCZ')
    expect(page).to have_content('Cidade: Maceio')
    expect(page).to have_content('50000m²')
  end

  it 'does not exist registered warehouse' do 
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Não há galpões cadastrados')
  end
end