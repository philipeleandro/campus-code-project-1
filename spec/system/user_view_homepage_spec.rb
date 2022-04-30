require 'rails_helper'

describe 'User visits homepage' do
  it 'sees app name' do
    # Arrange

    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end

  it 'sees the registered warehouses' do
    # Arrange
    # Create 2 warehouses: Rio and Maceio
    Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60000)
    Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50000)

    # Act
    visit('/')

    # Assert
    expect(page).not_to have_content('There is no registered warehouses')
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
    visit('/')

    # Assert
    expect(page).to have_content('Não há galpões cadastrados')
  end
end