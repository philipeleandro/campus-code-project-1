require 'rails_helper'

describe 'User visits homepage' do
  it 'sees app name' do
    # Arrange

    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end
end