class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @three_posts = @user.recent_three_posts
  end
end
