class AddColumnToBaggages2 < ActiveRecord::Migration[5.1]
  def change
    add_column :baggages, :size, :string
    add_column :baggages, :sex, :string
    add_column :baggages, :start_data, :date, null: true
  end
end
