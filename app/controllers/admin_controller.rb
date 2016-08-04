class AdminController < ApplicationController
  def index
  end

  def create
    if current_user.rank == "admin"
      @subreddit = Subreddit.new(name: params[:post][:name].downcase)
      @subreddit.save
      flash[:success] = "Saiddit Added!"
      redirect_to action: "index"
    end
  end
end
