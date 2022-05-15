require 'rails_helper'

describe 'User authentication' do
  it 'success' do
    user = User.create!(email: 'email@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Senha', with: 'password'
    within('form') do
      click_on 'Entrar'
    end

    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
    within('nav') do
      expect(page).to have_content('email@example.com')
    end
    expect(page).to have_content('Login efetuado com sucesso')
  end
end