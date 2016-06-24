class CommentController < ApplicationController

  def index
    @post = Post.find(1)
  end

  def new
  end

  def create
    @comment = Comment.new(
    comment: params[:comment][:comment],
    user_id: current_user.id,
    post_id: 1
    )
    @comment.save
    redirect_to comment_index_path
  end

end
