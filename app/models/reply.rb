class Reply < ApplicationRecord
  belongs_to :comment
  validates_presence_of :content
end
