require 'rails_helper'

RSpec.feature 'Users' do

  context 'registration' do
    let(:user) { attributes_for(:user) }

    it 'registers user' do
      visit new_user_registration_path

      fill_in 'Email', with: user[:email]
      fill_in 'Password', with: user[:password]
      fill_in 'Password confirmation', with: user[:password]

      click_on 'Sign up'

      expect(page).to have_content 'You have signed up successfully.'
    end
  end

  context 'updating' do
    let(:user) { create(:user) }

    it 'sets battletag' do
      login_as(user, scope: :user)
      battletag = 'Test#2320'

      visit edit_user_registration_path

      fill_in 'Battletag', with: battletag
      fill_in 'Current password', with: user.password

      click_on 'Update'

      expect(page).to have_content 'Your account has been updated successfully.'
      expect(user.reload.battletag).to eq(battletag)
    end
  end
end
