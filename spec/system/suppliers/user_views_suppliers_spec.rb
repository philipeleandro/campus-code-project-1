require 'rails_helper'

describe 'User sees suppliers' do
  it 'in menu' do
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end

    expect(current_path).to eq suppliers_path
  end

  it 'success' do 
    Supplier.create!(corporate_name: 'Guardians LTDA', brand_name: 'Guardians', registration_number: '4132600800010', full_address: 'Rua da Vitória, 1500', city: 'Bauru', state: 'São Paulo', email: 'guardians@example.com', phone: '12456387894')

    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end

    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('Guardians')
    expect(page).to have_content('Bauru - São Paulo')
  end

  it 'and not exist supplier' do
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end

    expect(page).to have_content('Não há fornecedores cadastrados')
  end
end