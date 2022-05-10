require 'rails_helper'

describe 'User edit a warehouse' do
  it 'in warehouse datails' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000, address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    # Assert
    expect(page).to have_content('Editar Galpão')
    expect(page).to have_field('Nome', with: 'Aeroporto SP')
    expect(page).to have_field('Descrição', with: 'Galpão destinado para cargas internacionais')
    expect(page).to have_field('Código', with: 'GRU')
    expect(page).to have_field('Endereço', with: 'Avenida do Aeroporto, 1000')
    expect(page).to have_field('Cidade', with: 'Guarulhos')
    expect(page).to have_field('CEP', with: '15000-000')
    expect(page).to have_field('Área', with: '100000')
  end

  it 'sucess' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000, address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: 'Galpão Internacional'
    fill_in 'Área', with: '110000'
    fill_in 'CEP', with: '16000-000'
    click_on 'Enviar'

    # Assert
    expect(page).to have_content('Galpão atualizado com sucesso')
    expect(page).to have_content('Nome: Galpão Internacional')
    expect(page).to have_content('Endereço: Avenida do Aeroporto, 1000')
    expect(page).to have_content('Área: 110000m²')
    expect(page).to have_content('CEP: 16000-000')
  end

  it 'keeps the data' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000, address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Área', with: '110000'
    fill_in 'CEP', with: ''
    click_on 'Enviar'

    # Assert
    expect(page).to have_content('Não foi possível atualizar o galpão')
  end
end