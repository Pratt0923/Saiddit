class AdminController < ApplicationController
  def index
  end

  def create
    @subreddit = Subreddit.new(name: params[:post][:name].downcase)
    @subreddit.save
  end
end
