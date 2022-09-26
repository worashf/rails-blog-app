def create_user(name)
     user  = User.new(name:,photo: "url-for-user#{name}-photo", bio: "Bio for #{name}" )
     user.save!
     user
end
