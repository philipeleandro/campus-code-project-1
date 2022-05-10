require 'rails_helper'

describe 'User delete a warehouse' do
  it 'success' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000, address: 'Avenida do Aeroporto, 1000', cep: '15000-000', description: 'Galpão destinado para cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Excluir'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Galpão removido com sucesso')
    expect(page).not_to have_content('Nome: Aeroporto SP')
    expect(page).not_to have_content('Código: GRU')
  end

  it 'does not delete others warehourses' do
    # Arrange
    warehouse_first = Warehouse.create(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000, address: 'Avenida aeroporto, 1000', cep: '20000-000', description: 'Galpão do Rio')
    warehouse_second = Warehouse.create(name: 'Maceio', code: 'MCZ', city: 'Maceio', area: 50_000, address: 'Avenida aeroporto, 1000', cep: '80000-000', description: 'Galpão do Maceió')

    # Act
    visit root_path
    click_on 'Rio'
    click_on 'Excluir'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content('Galpão removido com sucesso')
    expect(page).to have_content('Maceio')
    expect(page).not_to have_content('Rio')
  end
end