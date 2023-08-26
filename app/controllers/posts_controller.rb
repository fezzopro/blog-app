class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.recent_comments
  end

  def new
    @post = @current_user.posts.new
  end

  def create
    @post = @current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_post_path(@current_user, @post)
    else
      # Log validation errors
      Rails.logger.error(@post.errors.full_messages.join(', '))
      # Log other errors if any
      Rails.logger.error(@post.errors.inspect)
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(comments_counter: 0, likes_counter: 0)
  end
end
