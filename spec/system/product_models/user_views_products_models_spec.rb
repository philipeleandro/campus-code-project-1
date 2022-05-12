require 'rails_helper'

describe 'User sees product models' do
  it 'in menu' do
    visit root_path
    within('nav') do
      click_on 'Modelos de produtos'
    end

    expect(current_path).to eq product_models_path
  end

  it 'success' do
    supplier = Supplier.create!(corporate_name: 'Samsung LTDA', brand_name: 'Samsung', registration_number: '1234567897894', full_address: 'Rua teste, 1000', city: 'São Paulo', state: 'São Paulo', email: 'example@gmail.com', phone: '11254637894')

    ProductModel.create!(name: 'TV 32', weigth: 8000, width: 70,height: 45, depth: 10, sku: 'BBCDEFG45125SDASD8D8', supplier: supplier)
    ProductModel.create!(name: 'Notebook', weigth: 2500, width: 35,height: 23, depth: 20, sku: 'BBCDEFG45125SDASD8D7', supplier: supplier)

    visit root_path
    within('nav') do
      click_on 'Modelos de produtos'
    end

    expect(page).to have_content('TV 32')
    expect(page).to have_content('Notebook')
    expect(page).to have_content('Samsung')
    expect(page).to have_content('Samsung')
    expect(page).to have_content('BBCDEFG45125SDASD8D8')
    expect(page).to have_content('BBCDEFG45125SDASD8D7')
  end

  it 'does not exist register product model' do
    visit root_path
    click_on 'Modelos de produtos'

    expect(page).to have_content('Não há modelo de produto cadastrado')
  end
end