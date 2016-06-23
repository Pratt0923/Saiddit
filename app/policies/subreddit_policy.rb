class SubredditPolicy < ApplicationPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def create?
    true
  end
end
