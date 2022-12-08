class Like < ApplicationRecord
    belongs_to :account
    belongs_to :post
    validates_uniqueness_of :post_id, scope: :account_id
end