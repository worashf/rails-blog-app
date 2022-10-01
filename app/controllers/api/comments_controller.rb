class Api::CommentsController < ApplicationController
  before_action :authorize_request
  before_action :find_user_post

  def index
    @post = Post.find(params[:post_id])
    render json: @post.comments
  end

  def show
    comment = @post.comments.find_by_id!(params[:id])
    render json: comment
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Comment not found' }, status: :not_found
  end

  def create
    @commentor = current_user
    @post = Post.find(params[:post_id])
    @post_author = @post.author

    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = @commentor

    return unless @comment.save

    respond_to do |format|
      format.json do
        render json: @comment
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author, :post)
  end

  def find_user_post
    user = User.find_by_id!(params[:user_id])
    @post = user.posts.find_by_id!(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User and/or post not found' }, status: :not_found
  end
end
