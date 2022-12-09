class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum role: [:admin, :member]

  # Set the default role for an account to 'member'
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :member
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end


  def total_followers
    # self.followers.count
    Follower.where(follower_id: self.id).count
  end

  def total_following
    # self.following.count
    Follower.where(following_id: self.id).count
  end
end
