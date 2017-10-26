class AddBlandToBaggages < ActiveRecord::Migration[5.1]
  def change
    add_column :baggages, :bland, :string
  end
end
