require 'rails_helper'

describe 'User create account' do
  it 'success' do
    visit root_path
    click_on 'Entrar'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Luis'
    fill_in 'E-mail', with: 'eemail@example.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
    expect(page).to have_content('eemail@example.com')
    expect(page).to have_button('Sair')
  end
end