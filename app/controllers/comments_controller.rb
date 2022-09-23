class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @current_user = current_user
    @comment = Comment.new(comment_params)
    @comment.author = @current_user
    @comment.post = @post
    redirect_to user_post_path(@current_user, @post) if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author, :post)
  end
end
