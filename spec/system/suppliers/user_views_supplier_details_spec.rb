require 'rails_helper'

describe 'User sees suppliers details' do
  it 'sees additional details' do
    Supplier.create(corporate_name: 'Test LTDA', brand_name: 'Test', city: 'Rio de Janeiro', state: 'Rio de Janeiro', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'example@example.com', phone: '88945681236')

    visit root_path
    click_on 'Fornecedores'
    click_on 'Test'

    expect(page).to have_content('Test LTDA')
    expect(page).to have_content('Documento: 1234567897894')
    expect(page).to have_content('Endereço: Avenida aeroporto, 1000 - Rio de Janeiro - Rio de Janeiro')
    expect(page).to have_content('Email: example@example.com')
    expect(page).to have_content('Telefone: 88945681236')
  end

  it 'back to supplier index' do
    Supplier.create(corporate_name: 'Red LTDA', brand_name: 'RED', city: 'Juazeiro do Norte', state: 'Ceará', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'example@example.com', phone: '88945681236')

    visit root_path
    click_on 'Fornecedores'
    click_on 'RED'
    click_on 'Voltar'

    expect(current_path).to eq suppliers_path
  end
end