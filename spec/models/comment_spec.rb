require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Aboche', posts_counter: 0)
  post = Post.new(title: 'Some thing', author: user, likes_counter: 0, comments_counter: 0)
  c1 = Comment.new(text: 'Great job', author: user, post:)
  it 'comment with text should be valid' do
    expect(c1).to be_valid
  end
  it 'Comment with out user should not valid' do
    c2 = Comment.new(text: 'Something', post:)
    expect(c2).to be_invalid
  end
  it 'comment with out post should not valid' do
    c3 = Comment.new(text: 'congrat', author: user)
    expect(c3).to_not be_valid
  end
  it 'Text must not be null' do
    c4 = Comment.new(text: 'comment text', author: user)
    c4.text = nil
    expect(c4).to_not be_valid
  end

  it 'Post counter should be 2' do
    new_user = User.create(name: 'abebe', posts_counter: 0)
    new_post = Post.create(title: 'psot title', author: new_user, comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'comment 1', author: new_user, post: new_post)
    Comment.create(text: 'comment 2', author: new_user, post: new_post)

    expect(new_post.comments_counter).to eq 2
  end
end
