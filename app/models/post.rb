class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_posts_counter
    author.upadate(posts_counter: author.posts.count)
  end

  def recent_five_comments
    comments.includes(:post).order(created_at: :desc).limit(5)
  end
end
