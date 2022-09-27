require 'rails_helper'
require 'helpers/model_helper'
RSpec.describe 'User show page', type: :feature do
  before :each do
    @name1 = 'user1'
    @user = create_user(@name1)
    @posts = create_posts_for_user(@user, count: 5)
    visit user_path(@user)
  end
  it 'should show image of users' do
    expect(page).to have_css("img[src*='photo-url']")
  end

  it 'should show username of users' do
    expect(page).to have_content @name1
  end

  it 'shows the count of posts by user like 5' do
    expect(page).to have_content 'Numbers of posts: 5'
  end
  it 'shows the bio of user' do
    expect(page).to have_content "Bio of #{@name}"
  end
  it 'shows the last 3 posts by user' do
    expect(@user.recent_three_posts.length).to eq(3)
  end

  it 'shows a button to show all posts by user' do
    expect(page).to have_link 'See all posts'
  end

  it 'should show number of posts of users' do
    expect(page).to have_content('Numbers of posts: 5')
  end

  it 'gets redirected to all posts page when user clicks on see all posts button' do
    click_link 'See all posts'

    expect(page).to have_current_path(user_posts_path(@user))
  end
end
