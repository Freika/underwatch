require 'rails_helper'

RSpec.feature 'Users' do
  let!(:user) { attributes_for(:user) }

  context 'User registration' do
    it 'registers user' do
      visit new_user_registration_path

      fill_in 'Email', with: user[:email]
      fill_in 'Password', with: user[:password]
      fill_in 'Password confirmation', with: user[:password]

      click_on 'Sign up'

      expect(User.last.email).to eq(user[:email])
    end
  end
end
