require 'rails_helper'

describe 'User register a new product model' do
  it 'in product models index' do
    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar novo modelo de produto'

    expect(page).to have_field('Nome')
    expect(page).to have_field('Peso')
    expect(page).to have_field('Altura')
    expect(page).to have_field('Largura')
    expect(page).to have_field('Profundidade')
    expect(page).to have_field('Código SKU')
    expect(page).to have_field('Fornecedor')
  end

  it 'success' do
   Supplier.create!(corporate_name: 'Samsung LTDA', brand_name: 'Samsung', registration_number: '1234567897894', full_address: 'Rua teste, 1000', city: 'São Paulo', state: 'São Paulo', email: 'example@gmail.com', phone: '11254637894')

    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar novo modelo de produto'
    fill_in 'Nome', with: 'TV 32'
    fill_in 'Peso', with: '8000'
    fill_in 'Largura', with: '70'
    fill_in 'Altura', with: '45'
    fill_in 'Profundidade', with: '10'
    fill_in 'Código SKU', with: 'BBCDEFG45125SDASD8D8'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Cadastrar'

    expect(current_path).to eq product_models_path
    expect(page).to have_content('TV 32')
    expect(page).to have_content('SKU: BBCDEFG45125SDASD8D8')
    expect(page).to have_content('Fornecedor: Samsung')
  end

  it 'with incomplete data' do
    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar novo modelo de produto'
    click_on 'Cadastrar'

    expect(page).to have_content('Produto não cadastrado')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Peso não pode ficar em branco')
    expect(page).to have_content('Altura não pode ficar em branco')
    expect(page).to have_content('Profundidade não pode ficar em branco')
    expect(page).to have_content('Largura não pode ficar em branco')
    expect(page).to have_content('Código SKU não pode ficar em branco')
    expect(page).to have_content('Código SKU não possui o tamanho esperado (20 caracteres)')
    expect(page).to have_content('Código SKU não é válido')
    expect(page).to have_content('Peso não é um número')
    expect(page).to have_content('Largura não é um número')
    expect(page).to have_content('Altura não é um número')
    expect(page).to have_content('Profundidade não é um número')
  end
end