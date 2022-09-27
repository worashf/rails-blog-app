require 'rails_helper'
require 'helpers/model_helper'

RSpec.describe 'Posts', type: :feature do
  context 'Post show page' do
    before :each do
      @name = 'user'
      @user = create_user(@name)
      @posts = create_posts_for_user(@user, count: 5)
      @comments = create_comments_by_user(@user, @posts.first, count: 3)

      visit user_post_path(@user, @posts.first)
    end

    it 'Should show the post title' do
      expect(page).to have_content @posts.first.title
    end
    it 'Should show the author name of the post ' do
      expect(page).to have_content @posts.first.author.name
    end
    it 'Should show the number fo comments given for the post' do
      expect(page).to have_content 'Comments: 3'
    end
    it 'Should show the numbers of like for post' do
      expect(@posts.first.likes_counter).to be 0
    end
    it 'Should show the post text' do
      expect(page).to have_content @posts.first.text
    end
    it 'Should show the user name of the comentor' do
      @comments.each { |comment| expect(page).to have_content comment.author.name }
    end
    it 'Should show the comment text ' do
      @comments.each { |comment| expect(page).to have_content comment.text }
    end
  end
end
