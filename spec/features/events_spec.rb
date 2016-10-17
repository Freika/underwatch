require 'rails_helper'

describe 'Events' do
  let(:event) { build(:event) }
  let(:user) { create(:user) }

  context 'creating' do
    it 'successful for user' do
      login_as user

      visit new_event_path
      fill_form

      expect(page).to have_content('Event was successfully created')
    end

    it 'redirect for guest' do
      visit new_event_path

      expect(page).to have_content('Log in')
    end
  end

  private

  def fill_form
    fill_in 'Title', with: event.title
    fill_in 'Description', with: event.description
    select 'Medium', from: 'Difficulty'

    click_on 'Save'
  end
end
