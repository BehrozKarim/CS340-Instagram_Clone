class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_followers
    # self.followers.count
    0
  end

  def total_following
    # self.following.count
    0
  end
end
