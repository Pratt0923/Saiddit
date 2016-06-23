class PostController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def new
    @posts = current_user.posts.new
  end

  def show
    @signed_ins_posts = current_user.posts
  end

  def create
    @post = current_user.posts.new(title: params[:post][:title], content: params[:post][:content], subreddit_id: subreddit_id_method)
    @post.user_id = current_user.id
    @post.save!
    redirect_to post_index_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to post_index_path
  end

  def edit
    @post = current_user.posts.find params[:id]
  end

  def update
    @post = current_user.posts.find params[:id]
    if Subreddit.where(name: params[:post][:subreddit]) == []
      flash[:notice] = "that is not a valid subreddit"
      redirect_to :back
    else
      if @post.update posts_params
        flash[:notice] = "Item updated!"
        redirect_to post_index_path
      else
        render :edit
      end
    end
  end

    private
  def user_subreddits
    #define a users subreddits here for future use.
  end

  def posts_params
    params.require(:post).permit(:title, :content, :subreddit_name)
  end

  def subreddit_id_method
    (Subreddit.where(name: params[:post][:subreddit])).first.id
  end
end
