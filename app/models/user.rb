class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
        #  :recoverable, :rememberable, :trackable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.username = auth.info.first_name
    # assuming the user model has a name
    # user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end

  has_many :followee_users, class_name: 'Following', foreign_key: :follower_id
  has_many :followees, through: :followee_users
  has_many :follower_users, class_name: 'Following', foreign_key: :followee_id
  has_many :followers, through: :follower_users
  has_many :notes, dependent: :destroy
  has_many :likes
  validates :username, presence: true, uniqueness:  { case_sensitive: false }
  validates :email, presence: true

end
