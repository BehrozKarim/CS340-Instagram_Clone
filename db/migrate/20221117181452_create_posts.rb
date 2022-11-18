class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.references :account
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
