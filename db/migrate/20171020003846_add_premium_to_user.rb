class AddPremiumToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :premium, :bool, default: false
  end
end
