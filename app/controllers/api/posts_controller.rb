class Api::PostsController < ApplicationController
  before_action :authorize_request
  before_action :user

  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
    render json: @posts
  end

  def show
    post = @user.posts.find_by_id!(params[:id])
    render json: post
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Post not found' }, status: :not_found
  end

  private

  def user
    @user ||= User.find_by_id!(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end
