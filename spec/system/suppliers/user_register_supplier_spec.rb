require 'rails_helper'

describe 'User register a new supplier' do
  it 'in suppliers index' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'

    expect(page).to have_field('Razão social')
    expect(page).to have_field('Nome fantasia')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Email')
    expect(page).to have_field('Telefone')
  end

  it 'success' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'
    fill_in 'Razão social', with: 'Guardians LTDA'
    fill_in 'Nome fantasia', with: 'Guardians'
    fill_in 'CNPJ', with: '4132600800010'
    fill_in 'Endereço', with: 'Rua da Vitória, 1500'
    fill_in 'Cidade', with: 'Bauru'
    fill_in 'Estado', with: 'São Paulo'
    fill_in 'Email', with: 'guardians@example.com'
    fill_in 'Telefone', with: '88945621235'
    click_on 'Cadastrar'

    expect(current_path).to eq suppliers_path
    expect(page).to have_content('Cadastrado com sucesso')
    expect(page).to have_content('Guardians')
    expect(page).to have_content('Bauru - São Paulo')
  end

  it 'with incomplete data' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar Fornecedor'
    click_on 'Cadastrar'

    expect(page).to have_content('Fornecedor não cadastrado')
    expect(page).to have_content('Nome fantasia não pode ficar em branco')
    expect(page).to have_content('Razão social não pode ficar em branco')
    expect(page).to have_content('Cidade não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
    expect(page).to have_content('Estado não pode ficar em branco')
    expect(page).to have_content('Telefone não pode ficar em branco')
  end
end