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

    scenario 'dispay pic message' do
      visit '/pics'
      expect(page).to have_content('today is Wednesday')
      expect(page).not_to have_content('no pics yet!')
    end
  end
end
