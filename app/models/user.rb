class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
        #  :recoverable, :rememberable, :trackable

  has_many :followee_users, class_name: 'Following', foreign_key: :follower_id
  has_many :followees, through: :followee_users
  has_many :follower_users, class_name: 'Following', foreign_key: :followee_id
  has_many :followers, through: :follower_users
  has_many :notes, dependent: :destroy
  has_many :likes
  validates :username, presence: true, uniqueness: true, :case_sensitive => false
  validates :email, presence: true

end
