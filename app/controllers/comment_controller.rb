class CommentController < ApplicationController

  #TODO what if I want users to comment on others comments!!!!!
  def index
    @post = Post.find(params[:post_id])
    authorize @post
  end

  def create
    @comment = new_comment_params
    @comment.posted_by = current_user.email.gsub /@.+/, ''
    authorize @comment
    @comment.save
    redirect_to post_comment_index_path
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post = Post.find(params[:post_id])
    @comment.destroy
    redirect_to post_comment_index_path
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    @comment = Comment.find(params[:id])
      if @comment.update(
        comment: params[:comment][:comment]
        )
        flash[:notice] = "Comment updated!"
        redirect_to post_comment_index_path
      else
        render :edit
      end
    end




  private
  def new_comment_params
    Comment.new(
    comment: params[:comment][:comment],
    user_id: current_user.id,
    post_id: params[:post_id]
    )
  end

end
