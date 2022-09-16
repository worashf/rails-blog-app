require 'rails_helper'

RSpec.describe User, type: :model do
  user_one = User.new(name: 'Worash', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKwDUzPx_8HbFekSBrq3hQgDJqXooNDwtflR-nxL9VwQ&s',
                      bio: 'I am good problem solver and code review', posts_counter: 0)
  user_one.save!
  context 'Check user model validity' do
    it 'valid with all atribute' do
      expect(user_one).to be_valid
    end
    it 'User should not valid with out name' do
      user_one.name = nil
      expect(user_one).to be_invalid
    end
    it 'User should not valid with empty name' do
      user_one.name = ''
      expect(user_one).to be_invalid
    end

    it 'post counter  should be greater than or equal to zero' do
      expect(user_one.posts_counter).to be_kind_of(Numeric)
      expect(user_one.posts_counter).to be >= 0
    end
  end
  context 'Check post counter ' do
    user_two = User.create(name: 'Worash', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKwDUzPx_8HbFekSBrq3hQgDJqXooNDwtflR-nxL9VwQ&s',
                           bio: 'I am good problem solver and code review', posts_counter: 0)
    post1 = Post.new(author: user_two, title: 'Post title one', text: 'Post Description', likes_counter: 0,
                     comments_counter: 0)
    it 'Post counter should be 1' do
      expect(user_two.posts_counter).to be 0
    end
    it 'Post counter should be 1 after save one post' do
      post1.save!
      expect(user_two.posts_counter).to be 1
    end
  end

  context 'Check recent-three-post' do
    post1 = Post.new(author: user_one, title: 'Post title one', text: 'Post one Description', likes_counter: 0,
                     comments_counter: 0)

    post2 = Post.new(author: user_one, title: 'Post title two', text: 'Post two Description', likes_counter: 0,
                     comments_counter: 0)

    post3 = Post.new(author: user_one, title: 'Post title three', text: 'Post three Description', likes_counter: 0,
                     comments_counter: 0)

    post4 = Post.new(author: user_one, title: 'Post title four', text: 'Post four Description', likes_counter: 0,
                     comments_counter: 0)
    post1.save!
    post2.save!
    post3.save!
    post4.save!
    it 'Recent three post should return 3' do
      expect(user_one.recent_three_posts.size).to be 3
    end
    it 'Recent three post should have post info' do
      expect(user_one.recent_three_posts[0].title).to eq 'Post title four'
      expect(user_one.recent_three_posts[1].title).to eq 'Post title three'
      expect(user_one.recent_three_posts[2].title).to eq 'Post title two'
    end
  end
end
