class AddRoleToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :role, :integer, default: 0
  end
end
