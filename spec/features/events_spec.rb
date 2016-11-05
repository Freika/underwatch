require 'rails_helper'

RSpec.feature 'Events' do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  context 'creating' do
    let(:event) { attributes_for(:event) }

    it 'as guest fails' do
      visit new_event_path

      expect(page).to have_content(
        'You need to sign in or sign up before continuing.'
      )
    end

    it 'successfull' do
      login_as(user, scope: :user)

      visit new_event_path

      fill_in 'Title', with: event[:title]
      fill_in 'Description', with: event[:description]
      select  event[:mode].capitalize, from: 'Mode'

      click_on 'Save'

      expect(page).to have_content 'Event was successfully created.'
    end
  end

  context 'editing' do
    let(:event) { create(:event, user: user) }

    it 'can be done by author' do
      login_as(user, scope: :user)

      visit event_path(event)

      click_on 'Edit'
      fill_in 'Title', with: 'Updated title'
      click_on 'Save'

      expect(page).to have_content 'Event was successfully updated.'
      expect(page).to have_content 'Updated title'
    end

    it 'unavailable for guest' do
      login_as(user2, scope: :user)

      visit event_path(event)

      expect(page).to_not have_link 'Edit'
    end
  end

  context 'deleting' do
    let(:event) { create(:event, user: user) }

    it 'can be done by author' do
      login_as(user, scope: :user)

      visit event_path(event)

      click_on 'Destroy'

      expect(page).to have_content 'Event was successfully destroyed.'
    end

    it 'unavailable for guest' do
      login_as(user2, scope: :user)

      visit event_path(event)

      expect(page).to_not have_link 'Destroy'
    end
  end
end
