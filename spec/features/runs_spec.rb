require 'rails_helper'

describe 'Runs' do
  let(:run) { build(:run) }
  let(:user) { create(:user) }

  context 'creating' do
    before(:each) do
      create_list(:event, 3)
    end

    it 'successful for user' do
      login_as user

      visit new_run_path
      fill_form

      expect(page).to have_content('Run was successfully created')
    end

    it 'redirect for guest' do
      visit new_run_path

      expect(page).to have_content('Log in')
    end
  end

  private

  def fill_form
    fill_in 'Title', with: run.title
    fill_in 'Description', with: run.description

    click_on 'Save'
  end
end
