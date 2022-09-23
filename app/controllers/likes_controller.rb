class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @current_user = current_user
    @user_liked = Like.where(author: @current_user, post: @post)
    return if @user_liked.present?

    @like = Like.new(author: @current_user, post: @post)
    if @like.save
      flash[:notice] = 'Liked successfuly'
      redirect_to user_post_path(@post.author, @post)
    else
      flash.now[:error] = 'Error: Like could not be saved'
      render :new, status: 422
    end
  end
end
