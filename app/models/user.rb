class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
        #  :recoverable, :rememberable, :trackable

  has_many :notes, dependent: :destroy
  has_many :likes
  validates :username, presence: true, uniqueness: true, :case_sensitive => false
  validates :email, presence: true

end
