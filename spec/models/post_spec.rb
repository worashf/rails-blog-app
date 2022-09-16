require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Wonde', photo: 'http://wonde-photo.com', bio: 'Wonde bio', posts_counter: 0)
  post1 = Post.new(author: user, title: 'Post title', text: ' psot description', comments_counter: 0,
                   likes_counter: 0)
  user.save!
  post1.save!
  context 'Check post initialization' do
    it 'Post with title should be valid' do
      expect(post1).to be_valid
    end
    it 'Post with null title should not valid' do
      post1.title = nil
      expect(post1).to be_invalid
    end
    it 'comment counter should be greater than or equal to zero ' do
      expect(post1.comments_counter).to be >= 0
    end
    it 'like counter should be greater than or equal to zero ' do
      expect(post1.likes_counter).to be >= 0
    end
  end

  context 'check rece nt five comments method' do
    post2 = Post.create(author: user, title: 'Post title', text: ' psot description', comments_counter: 0,
                        likes_counter: 0)

    Comment.create(post: post2, author: user, text: 'Oh that is great')
    Comment.create(post: post2, author: user, text: 'Good job')
    Comment.create(post: post2, author: user, text: 'Congragulation')
    Comment.create(post: post2, author: user, text: 'Amazing')
    Comment.create(post: post2, author: user, text: 'Keep it up')
    Comment.create(post: post2, author: user, text: 'move to the next step')
    Comment.create(post: post2, author: user, text: 'Please upgrade')
    it 'recent five comments method should return five ' do
      expect(post2.recent_five_comments.size).to be 5
    end
    it 'recent five comments method should return comment information ' do
      expect(post2.recent_five_comments[0].text).to eq 'Please upgrade'
      expect(post2.recent_five_comments[1].text).to eq 'move to the next step'
      expect(post2.recent_five_comments[2].text).to eq 'Keep it up'
      expect(post2.recent_five_comments[3].text).to eq 'Amazing'
      expect(post2.recent_five_comments[4].text).to eq 'Congragulation'
    end
  end
end
