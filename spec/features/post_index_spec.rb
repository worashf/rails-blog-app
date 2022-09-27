require 'rails_helper'
require 'helpers/model_helper'

RSpec.describe 'Posts', type: :feature do
  before :each do
    @name = 'user name'
    @user = create_user(@name)
    @posts = create_posts_for_user(@user, count: 5)
    @comments = create_comments_by_user(@user, @posts.first, count: 5)
    visit user_posts_path(@user)
  end

  it 'Should see the user photo' do
    expect(page).to have_css("img[src*='photo-url']")
  end

  it 'Should see user name' do
    expect(page).to have_content @name
  end

  it 'Should return the corect number of the users posts' do
    expect(page).to have_content 'Numbers of posts: 5'
    expect(@user.posts_counter).to be 5
  end

  it "Show user post\'s title" do
    expect(page).to have_content @posts.first.title
  end
  it "Should show some of post\'s text" do
    expect(page).to have_content @posts.first.text
  end
  it 'Should show the the first comment' do
    expect(page).to have_content @comments.first.text
  end
  it 'Should show the numbers of comments for post' do
    expect(@posts.first.comments_counter).to be 5
    expect(page).to have_content 'Comments: 5'
  end
  it 'Should show the numbers of comments for post' do
    expect(@posts.first.comments_counter).to be 5
    expect(page).to have_content 'Comments: 5'
  end
  it 'Should show the numbers of like for post' do
    expect(@posts.first.likes_counter).to be 0
  end
  it 'Should have pagination to see more posts' do
    expect(page).to have_button('Pagination')
  end
  it " Should   redirects to that post's show page, when click" do
    click_link @posts.first.title
    expect(page).to have_current_path(user_post_path(@user, @posts.first))
  end
  it 'Should show the numbers of like for post' do
    expect(@posts.first.likes_counter).to be 0
  end

  it 'Should have pagination to see more posts' do
    expect(page).to have_button('Pagination')
  end
  it " Should   redirects to that post's show page, when click" do
    click_link @posts.first.title
    expect(page).to have_current_path(user_post_path(@user, @posts.first))
  end
end
