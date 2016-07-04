class ReplyPolicy < ApplicationPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

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
    (user.id == post.comment.user_id) || is_admin? || is_mod?
  end

  def edit?
    (user.id == post.comment.user_id) || is_admin? || is_mod?
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
