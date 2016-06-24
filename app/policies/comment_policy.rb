class CommentPolicy < ApplicationPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end
#can't I just put all of this into application_policy? 
  def index?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def destroy?
    (user == post.user) || is_admin? || is_mod?
  end

  def edit?
    user == post.user || is_admin? || is_mod?
  end

  def update?
    edit?
  end

    private
  def is_admin?
    user.rank == "admin"
  end

  def is_mod?
    user.rank == "mod" && (post.subreddit.name) == user.board_control
  end
end
