class AddSexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sex, :string, default: "woman"
  end
end
