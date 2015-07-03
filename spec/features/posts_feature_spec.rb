require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'no posts yet!'
      expect(page).to have_link 'add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(message: 'today is Wednesday')
    end

    scenario 'display post message' do
      visit '/'
      expect(page).to have_content('today is Wednesday')
      expect(page).not_to have_content('no posts yet!')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a message,
              then displays the new post message' do
      visit '/'
      click_link 'add a post'
      fill_in 'Message', with: 'today is Wednesday'
      click_button 'Create Post'
      expect(page).to have_content 'today is Wednesday'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts and their messages' do
    let!(:newbie) { Post.create message: 'newbie' }

    scenario 'lets a user view a post message' do
      visit '/'
      click_link 'newbie'
      expect(page).to have_content 'newbie'
      expect(current_path).to eq "/posts/#{newbie.id}"
    end
  end

  context 'deleting posts and their messages' do
    before { Post.create message: 'this is new' }

    scenario 'removes a post when a user clicks delete link' do
      visit '/posts'
      click_link 'delete this is new'
      expect(page).not_to have_content 'this is new'
      expect(page).to have_content 'post deleted successfully'
    end
  end
end
