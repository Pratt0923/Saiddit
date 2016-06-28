class PostController < ApplicationController

  def index
    @posts = current_user.posts
    authorize @posts
  end

  def new
    @subreddit = Subreddit.all
    @posts = current_user.posts.new
    authorize @posts
  end

  def show
    @signed_ins_posts = current_user.posts
  end

  def create
    @post = current_user.posts.new(title: params[:post][:title], content: params[:post][:content], subreddit_id: subreddit_id_method)
    @post.user_id = current_user.id
    @post.posted_by = current_user.email.gsub /@.+/, ''
    authorize @post
    @post.save!
    redirect_to post_index_path
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to post_index_path
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find params[:id]
    authorize @post
    if Subreddit.where(name: params[:post][:subreddit]) == []
      flash[:danger] = "That is not a valid Saiddit"
      redirect_to :back
    else
      if @post.update posts_params
        flash[:notice] = "Post updated!"
        redirect_to post_index_path
      else
        render :edit
      end
    end
  end

  def upvote
    @post = Post.find params[:post_id]
    @post.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back, notice: "done!" }
      format.json { render json: { status: :ok, message: score } }
    end
  end

  def downvote
    @post = Post.find params[:post_id]
    @post.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back, notice: "done!" }
      format.json { render json: { status: :ok, message: score } }
    end
  end

  private

  def score
    @post.get_upvotes.size - @post.get_downvotes.size
  end

  def user_subreddits
    #TODO: define a users subreddits here for future use.
  end

  def posts_params
    params.require(:post).permit(:title, :content, :subreddit_name, :posted_by)
  end

  def subreddit_id_method
    (Subreddit.where(name: params[:post][:subreddit])).first.id
  end
end
