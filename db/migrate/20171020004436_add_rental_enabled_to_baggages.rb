class AddRentalEnabledToBaggages < ActiveRecord::Migration[5.1]
  def change
    add_column :baggages, :rental_enabled, :bool, default: true
  end
end
