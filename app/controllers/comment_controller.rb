class CommentController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
  end

  def new
  end

  def create
    @comment = Comment.new(
    comment: params[:comment][:comment],
    user_id: current_user.id,
    post_id: params[:post_id]
    )
    @comment.posted_by = current_user.email.gsub /@.+/, ''
    @comment.save
    redirect_to post_comment_index_path
  end

end
