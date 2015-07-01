require 'rails_helper'

feature 'pics' do
  context 'no pics have been added' do
    scenario 'should display a prompt to add a pic' do
      visit '/pics'
      expect(page).to have_content 'no pics yet!'
      expect(page).to have_link 'add a pic'
    end
  end

  context 'pics have been added' do
    before do
      Pic.create(message: 'today is Wednesday')
    end

    scenario 'display pic message' do
      visit '/pics'
      expect(page).to have_content('today is Wednesday')
      expect(page).not_to have_content('no pics yet!')
    end
  end

  context 'creating pic posts' do
    scenario 'prompts user to fill out a message,
              then displays the new pic message' do
      visit '/pics'
      click_link 'add a pic'
      fill_in 'Message', with: 'today is Wednesday'
      click_button 'Create Pic'
      expect(page).to have_content 'today is Wednesday'
      expect(current_path).to eq '/pics'
    end
  end

  # context 'viewing pics' do
  #   let!(:newbie) { Pic.create }

  #   scenario 'lets a user view a pic' do
  #     visit '/pics'
  #     click_link 'newbie'
  #     expect(page).to have_content 'newbie'
  #     expect(current_path).to eq "/pics/#{newbie.id}"
  #   end
  # end

  context 'deleting pics' do
    before { Pic.create message: 'this is new' }

    scenario 'removes a pic when a user clicks a delete link' do
      visit '/pics'
      click_link 'delete this is new'
      expect(page).not_to have_content 'this is new'
      expect(page).to have_content 'pic deleted successfully'
    end
  end
end
