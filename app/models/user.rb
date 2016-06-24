class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, through: :posts
  has_many :posts
  has_many :subreddits
end
