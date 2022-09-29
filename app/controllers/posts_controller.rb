class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:author, comments: [:author]).find(params[:id])
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.author = @user
    if @post.save

      redirect_to user_posts_path(@user.id)
    else

      flash.now[:error] = 'Post title can not be empty'
      render :new, status: 422
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_posts_path(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
