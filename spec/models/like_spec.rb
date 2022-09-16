require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'name of the user', posts_counter: 0)
  post = Post.create(title: 'title of the post', author: user, comments_counter: 0, likes_counter: 0)
  like = Like.create(author: user, post:)
  it 'like should be vaild with all valid atribute' do
    expect(like).to be_valid
  end
  it 'like with no user should be invalid' do
    like1 = Like.new(post:)
    expect(like1).to_not be_valid
  end
  it 'Like  with no post should be invalid' do
    like2 = Like.new(author: user)
    expect(like2).to be_invalid
  end

  it 'Likes counter  should be  3' do
    user1 = User.create(name: 'username', posts_counter: 0)
    user2 = User.create(name: 'username', posts_counter: 0)
    user3 = User.create(name: 'username', posts_counter: 0)
    new_post = Post.create(title: 'post title', author: user1, likes_counter: 0, comments_counter: 0)
    Like.create(author: user1, post: new_post)
    Like.create(author: user2, post: new_post)
    Like.create(author: user3, post: new_post)
    expect(new_post.likes_counter).to be 3
  end
end
