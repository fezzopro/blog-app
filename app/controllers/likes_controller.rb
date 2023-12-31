class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post: @post)

    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id), notice: 'Post liked.'
    else
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id), alert: 'Action failed.'
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @post = @like.post

    if @like.destroy
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id), notice: 'Post unliked.'
    else
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id), alert: 'Failed to unlike.'
    end
  end
end
