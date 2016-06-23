class Post < ApplicationRecord
  belongs_to :subreddit
  has_many :comments
  belongs_to :user
end
