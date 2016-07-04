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

  def destroy
    @reply = Reply.find_by(id: params[:id])
    @reply.destroy
    redirect_to post_comment_index_path
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find params[:id]
    authorize @reply
    update_reply
  end

  private
  def update_reply
    if @reply.update(
      content: params[:reply][:content]
      )
      flash[:notice] = "Comment updated!"
      redirect_to post_comment_index_path
    else
      render :edit
    end
  end
end
