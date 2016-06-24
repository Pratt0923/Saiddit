class Post < ApplicationRecord
  belongs_to :subreddit
  has_many :comments
  belongs_to :user
  validates_uniqueness_of :title
  validates_presence_of :content

  acts_as_votable
  
  def subreddit_name
    self.subreddit.name
  end

  def subreddit_name=(x)
  end
end
