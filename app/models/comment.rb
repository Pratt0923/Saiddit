class Comment < ApplicationRecord
  validates_presence_of :comment
  belongs_to :post
  has_many :replies
end
