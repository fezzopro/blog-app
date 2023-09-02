class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @current_user.comments.new(params.permit(:text))
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(user_id: @current_user.id, id: @post.id),
                  notice: 'Comment added successfully.'
    else
      render :new
    end
  end
end
