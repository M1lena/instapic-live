require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('sign in')
      expect(page).to have_link('sign up')
    end

    it "should not see 'sing out' link" do
      visit('/')
      expect(page).not_to have_link('sign out')
    end
  end

  context 'user signed in on the homepage' do
    before do
      visit('/')
      click_link('sign up')
      fill_in('user[email]', with: 'test@example.com')
      fill_in('user[password]', with: 'test1234')
      fill_in('user[password_confirmation]', with: 'test1234')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('sign in')
      expect(page).not_to have_link('sign up')
    end
  end
end
