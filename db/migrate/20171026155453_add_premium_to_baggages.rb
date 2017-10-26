class AddPremiumToBaggages < ActiveRecord::Migration[5.1]
  def change
    add_column :baggages, :premium, :bool, default: false
  end
end
