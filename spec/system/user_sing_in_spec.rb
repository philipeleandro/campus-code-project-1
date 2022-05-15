require 'rails_helper'

describe 'User authentication' do
  it 'success' do
    user = User.create!(email: 'email@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'email@example.com'
    fill_in 'Senha', with: 'password'
    within('form') do
      click_on 'Entrar'
    end

    expect(page).not_to have_link('Entrar')
    expect(page).to have_button('Sair')
    within('nav') do
      expect(page).to have_content('email@example.com')
    end
    expect(page).to have_content('Login efetuado com sucesso')
  end

  it 'logout' do
    user = User.create!(email: 'email@example.com', password: 'password')

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'email@example.com'
    fill_in 'Senha', with: 'password'
    within('form') do
      click_on 'Entrar'
    end
    click_on 'Sair'

    expect(page).to have_content('Logout efetuado com sucesso')
    expect(page).to have_link('Entrar')
    expect(page).not_to have_button('Sair')
    expect(page).not_to have_content('email@example.com')
  end
end