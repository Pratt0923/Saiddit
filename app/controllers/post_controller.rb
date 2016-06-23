class PostController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @posts = current_user.posts.new
  end

  def show
    @signed_ins_posts = current_user.posts
  end

  def create
      @post = current_user.posts.new(title: params[:post][:title], content: params[:post][:content])
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
    if @post.update posts_params
      flash[:notice] = "Item updated!"
      redirect_to post_index_path
    else
      render :edit
    end
  end

    private
  def user_subreddits
    #define a users subreddits here for future use.
  end

  def posts_params
    params.require(:post).permit(:title, :content)
  end
#posts will belong to a subreddit. a subreddit with have many users. a comment will belong to a post.
#users will favorite subreddits(subreddit_id)
#each post will have a subreddit id attached to it
#when they favorite subreddits it will record the subreddit id
#their index page will be all of the subreddits that they have favorited.

end
