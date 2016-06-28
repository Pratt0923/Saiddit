class Post < ApplicationRecord
  belongs_to :subreddit
  has_many :comments
  belongs_to :user
  validates_presence_of :content, :title
  acts_as_votable
end
