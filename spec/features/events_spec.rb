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
    let(:event) { create(:event, author: user) }

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
    let(:event) { create(:event, author: user) }

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

  context 'participating' do
    let!(:event) { create(:event, author: user) }

    context 'as guest' do
      before(:each) { login_as(user2, scope: :user) }

      it 'can be successfully requested' do
        visit event_path(event)

        click_on 'Participate'

        expect(page).to have_content 'You requested participation'
      end

      it 'can be canceled' do
        visit event_path(event)
        click_on 'Participate'
        click_on 'Cancel participation'

        expect(page).to have_content 'You canceled request'
      end
    end

    context 'as author' do
      let!(:participation) { create(:participation, event: event, user: user2) }
      before(:each) { login_as(user, scope: :user) }

      it 'lists requests on event page' do
        visit event_path(event)

        within '#requests' do
          expect(page).to have_link user2.battletag
        end
      end

      it 'can approve request' do
        visit event_path(event)

        within "#request-#{participation.id}" do
          click_on 'Approve'
        end

        expect(page).to have_content 'Request approved.'
      end

      it 'can decline request' do
        visit event_path(event)

        within "#request-#{participation.id}" do
          click_on 'Cancel'
        end

        expect(page).to have_content 'You canceled request'
      end
    end
  end
end
