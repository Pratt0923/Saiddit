class CommentController < ApplicationController
  before_action :authenticate_user!
  def index
    @comments = current_user.comments
    authorize @comments
  end

  def new
    @comments = current_user.comments.new
    authorize @comments
  end

  def show
    @signed_ins_comments = current_user.comments
  end

  def create
    @comment = current_user.comments.new(content: params[:comment][:content])
    @comment.user_id = current_user.id
    authorize @comment
    @comment.save!
    redirect_to comment_index_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to comment_index_path
  end

  def edit
    @comment = Comment.find params[:id]
    authorize @comment
  end

  def update
    @comment = Comment.find params[:id]
    authorize @comment
    if Post.where(name: params[:comment][:post]) == []
      flash[:danger] = "The post you are commenting on has been deleted!"
      redirect_to :back
    else
      if @comment.update comments_params
        flash[:notice] = "Comment updated!"
        redirect_to comment_index_path
      else
        render :edit
      end
    end
  end
end
