class CommentController < ApplicationController
#need to change this so it is not hardcoded into post 1 but its difficult.
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
    @comment.save
    redirect_to post_comment_index_path
  end

end
