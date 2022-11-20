class AddUsernameToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :first_name, :string, :limit => 20
    add_column :accounts, :last_name, :string, :limit => 20
    add_column :accounts, :username, :string, :limit => 20
    # add_column :accounts, :bio, :text, :limit => 160

    #Ex:- :limit => 40
  end
end
