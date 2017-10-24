class AddUserNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :credit_number, :integer
    add_column :users, :credit_password, :integer
  end
end
