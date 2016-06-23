class SubredditController < ApplicationController
  before_action :authenticate_user!

  def index
    @subreddit = Subreddit.all
  end

  def new

  end

  def show
  end

  def create
    if Subreddit.where(name: params[:subreddit][:name]) != []
      @subreddit = Subreddit.where(name: params[:subreddit][:name])
    else
      flash[:success] = "That Saiddit does not exist!"
      #do something other then this. I just wanted to make sure it works :P
      redirect_to subreddit_index_path
    end
  end
end
