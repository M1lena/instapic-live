require 'rails_helper'

feature 'pics' do
  context 'no pics have been added' do
    scenario 'should display a prompt to add a pic' do
      visit '/pics'
      expect(page).to have_content 'no pics yet!'
      expect(page).to have_link 'add a pic'
    end
  end
end
