class AddAvatorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar_url, :string, default: "https://s3-ap-northeast-1.amazonaws.com/ateam-demoapp/default_avatar.jpg"
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
  end
end
