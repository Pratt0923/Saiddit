class Post < ApplicationRecord
  belongs_to :subreddit
  has_many :comments
end
