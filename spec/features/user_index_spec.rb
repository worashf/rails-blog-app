require 'rails_helper'
require 'helpers/model_helper'

RSpec.describe 'Users', type: :feature do
  context 'user index page' do
    before(:each) do
      @name = 'user'
      @user =create_user(@name)
      @user.save
      visit users_path
      
 
    end

    it 'should show username of users' do
      expect(page).to have_content('user')
    end

    it 'should show image of users' do
      expect(page).to have_css("img[src*='photo-url']")
    end

    it 'should show number of posts of users' do
      expect(page).to have_content('Numbers of posts: 0')
    end
    it 'should show number of posts of users' do
      @user.posts_counter = 1

      [@user].each(&:save)
  
      visit users_path
  
      expect(page).to have_content 'Numbers of posts: 1'
 
    end

    it 'should click open profile button and redirect to that user show page' do
      click_link @name

      expect(page).to have_current_path(user_path(@user))
    end

  
  end
end