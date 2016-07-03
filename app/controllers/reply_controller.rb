class ReplyController < ApplicationController
  def index
    @comment = Comment.find_by(id: params[:comment_id])
  end

  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @reply = Reply.new(content: params[:reply][:content], comment_id: @comment.id)
    @reply.user = current_user.email.gsub /@.+/, ''
    @reply.save
    redirect_to post_comment_index_path
  end
end
