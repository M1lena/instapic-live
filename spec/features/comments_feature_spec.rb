require 'rails_helper'

feature 'comments' do
  context 'leaving post comments' do
    before { Post.create message: 'newtry' }

    scenario 'allows users to leave a comment' do
      visit '/'
      click_link 'comment'
      fill_in 'comment[comments]', with: 'nice one'
      click_button 'submit'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing post comments' do
    let!(:friendly) { Post.create message: 'friendly' }

    scenario 'display comments only when viewing posts page' do
      visit '/'

      click_link 'comment'
      fill_in 'comment[comments]', with: 'nice one'
      click_button 'submit'

      click_link 'friendly'
      visit "/posts/#{friendly.id}"
      expect(current_path).to eq "/posts/#{friendly.id}"
      expect(page).to have_content 'nice one'
    end
  end
end
