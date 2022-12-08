class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :follower, references: :accounts
      t.references :following, references: :accounts
    
      t.integer :account_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
