class InviteUsersController < ApplicationController

  def index
  end

  def create
    User.invite!(
    :email => params[:users][:email],
    :rank => params[:users][:rank],
    :board_control => params[:users][:board_control])
  end
end
