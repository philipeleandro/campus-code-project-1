require 'rails_helper'

describe 'User edit a supplier' do
  it 'in supplier details' do
    Supplier.create!(corporate_name: 'CNB LTDA', brand_name: 'CNB', city: 'São Paulo', state: 'São Paulo', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'example@example.com', phone: '88945681236')

    visit root_path
    click_on 'Fornecedores'
    click_on 'CNB'
    click_on 'Editar'

    expect(page).to have_content('Editar Fornecedor')
    expect(page).to have_field('Razão social', with: 'CNB LTDA')
    expect(page).to have_field('Nome fantasia', with: 'CNB')
    expect(page).to have_field('CNPJ', with: '1234567897894')
    expect(page).to have_field('Cidade', with: 'São Paulo')
    expect(page).to have_field('Estado', with: 'São Paulo')
    expect(page).to have_field('Endereço', with: 'Avenida aeroporto, 1000')
    expect(page).to have_field('Telefone', with: '88945681236')
    expect(page).to have_field('Email', with: 'example@example.com')
  end

  it 'success' do
  Supplier.create!(corporate_name: 'CNB LTDA', brand_name: 'CNB', city: 'São Paulo', state: 'São Paulo', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'example@example.com', phone: '88945681236')

    visit root_path
    click_on 'Fornecedores'
    click_on 'CNB'
    click_on 'Editar'
    fill_in 'Telefone', with: '111234567894'
    fill_in 'Endereço', with: 'Rua das empresas, 700'
    fill_in 'Cidade', with: 'São Bernardo do Campo'
    click_on 'Cadastrar'

    expect(page).to have_content('Editado com sucesso')
    expect(page).to have_content('Fornecedor CNB LTDA')
    expect(page).to have_content('Documento: 1234567897894')
    expect(page).to have_content('Endereço: Rua das empresas, 700 - São Bernardo do Campo - São Paulo')
    expect(page).to have_content('Telefone: 111234567894')
    expect(page).to have_content('Email: example@example.com')
  end

  it 'incomplete or wrong data' do
    Supplier.create(corporate_name: 'CNB LTDA', brand_name: 'CNB', city: 'São Paulo', state: 'São Paulo', registration_number: '1234567897894', full_address: 'Avenida aeroporto, 1000', email: 'example@example.com', phone: '88945681236')

    visit root_path
    click_on 'Fornecedores'
    click_on 'CNB'
    click_on 'Editar'
    fill_in 'CNPJ', with: '12345'
    fill_in 'Telefone', with: ''
    fill_in 'Endereço', with: 'Rua das empresas, 700'
    fill_in 'Cidade', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Não foi possível atualizar o fornecedor')
  end
end