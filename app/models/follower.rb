class Follower < ApplicationRecord
    # belongs_to :accounts, foreign_key: :follower_id
    
    validates_uniqueness_of :follower_id, scope: :following_id
    # validates :follower_id, presence: true
    # validates :following_id, presence: true
end