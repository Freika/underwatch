require 'rails_helper'

describe 'Events' do
  let(:event) { build(:event) }

  context 'creating' do
    it 'successful' do
      visit new_event_path

      fill_in 'Title', with: event.title
      fill_in 'Description', with: event.description
      select 'Medium', from: 'Difficulty'

      click_on 'Save'

      expect(page).to have_content('Event was successfully created')
    end
  end
end
