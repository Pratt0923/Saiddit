class SubredditController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @subreddit = Subreddit.all
    authorize @subreddit
  end

  def new

  end

  def show
  end

  def create
    if Subreddit.where(name: params[:subreddit][:name].downcase) != []
      @subreddit = Subreddit.where(name: params[:subreddit][:name].downcase)
      authorize @subreddit
    else
      flash[:danger] = "That Saiddit does not exist!"
      #do something other then this. I just wanted to make sure it works :P
      redirect_to subreddit_index_path
    end
  end
end
