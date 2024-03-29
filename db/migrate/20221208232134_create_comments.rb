class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.references :account, foreign_key: true
      t.string :comment
      t.timestamps
    end
  end
end
