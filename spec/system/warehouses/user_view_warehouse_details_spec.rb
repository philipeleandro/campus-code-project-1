require 'rails_helper'

describe 'User sees warehouses details' do
  it 'sees additional details' do
    # Arrange
    Warehouse.create(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000, address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP' 

    # Assert
    expect(page).to have_content('Galpão GRU')
    expect(page).to have_content('Nome: Aeroporto SP')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Área: 100000m²')
    expect(page).to have_content('Endereço: Avenida do Aeroporto, 1000 CEP: 15000-000')
    expect(page).to have_content('Galpão destinado para cargas internacionais')
  end

  it 'back to homepage' do
    # Arrange
    Warehouse.create(name: 'Aeroporto JDN', code: 'JDN', city: 'Juazeiro do Norte', area: 30_000, address: 'Avenida do Aeroporto, 750', cep: '63000-000', description: 'Galpão para a cargas de JDN')

    # Act
    visit root_path
    click_on 'Aeroporto JDN'
    click_on 'Voltar'

    # Assert
    expect(current_path).to eq('/')
  end
end 