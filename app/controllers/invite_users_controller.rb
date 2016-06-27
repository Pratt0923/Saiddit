class InviteUsersController < ApplicationController

  def index
    @subreddit = Subreddit.all
  end

  def create
    if User.where(email: params[:users][:email]) == []
      invite_user
      flash[:success] = "User Invited!"
      redirect_to post_index_path
    else
      flash[:danger] = "That user already exists"
      redirect_to :back
    end
  end

  private
  def invite_user
    User.invite!(
    email: params[:users][:email],
    rank: params[:users][:rank],
    board_control: params[:users][:board_control])
  end
end
