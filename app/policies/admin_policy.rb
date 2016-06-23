class ApplicationPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    is_admin?
  end

  private
  def is_admin?
    user.rank == "admin"
  end
end
