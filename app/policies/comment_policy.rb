class CommentPolicy < ApplicationPolicy
  def initialize(user, comment)
    @user = user
    @comment = comment
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
    (user.id == @comment.user_id) || is_admin? || is_mod?
  end

  def edit?
    user.id == @comment.user_id || is_admin? || is_mod?
  end

  def update?
    edit?
  end

    private
  def is_admin?
    user.rank == "admin"
  end

  def is_mod?
    if user.board_control != "no_board"
      user.rank == "mod" && Subreddit.where(name: user.board_control).id == @comment.post_id
    else
      false
    end
  end
end
