class SubredditController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @subreddit = Subreddit.all.includes(:posts => [:user])
    authorize @subreddit
  end

  def create
    if Subreddit.where(name: params[:subreddit][:name].downcase) != []
      @subreddit = Subreddit.where(name: params[:subreddit][:name].downcase).includes(:posts => [:user])
      authorize @subreddit
    else
      flash[:danger] = "That Saiddit does not exist!"
      redirect_to subreddit_index_path
    end
  end
end
