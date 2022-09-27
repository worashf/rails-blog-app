
def create_user(name)
    user = User.create!(
        name:, bio: "Bio of #{name}", photo: 'photo-url'
      )
      user.save
      user
end

def create_posts_for_user(user, count: 1)
    posts = []
    count.times do |p|
      posts << Post.create!(
        author: user,
        title: "Post #{p}",
        text: "This is description of post #{p}",
     
      )
    end
    posts
  end

  def create_comments_by_user(user, post, count: 1)
   comments = []
   count.times do |c| 
    comment = Comment.create!(post:, author: user, text: "Coment text of #{c}")
    comments << comment
   end
  comments

  end