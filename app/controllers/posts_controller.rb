class PostsController < ApplicationController
  def index

    @posts = Post.includes(:author).where(author: params[:user_id])
  end

  def show
    @post = Post.includes(:author, comments:[:author]).find(params[:id])
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.author = @user
    if @post.save

      redirect_to user_posts_path(@user), notice: 'Post saved successfully'
    else

      flash.now[:error] = 'Post title can not be empty'
      render :new, status: 422
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
