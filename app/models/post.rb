class Post < ApplicationRecord
  belongs_to :subreddit
  has_many :comments
  belongs_to :user

  def subreddit_name
    self.subreddit.name
  end

  def subreddit_name=(x)
  end
end
