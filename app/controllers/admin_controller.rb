class AdminController < ApplicationController
  def index
  end

  def create
    @subreddit = Subreddit.new(name: params[:post][:name])
    @subreddit.save
  end
end
