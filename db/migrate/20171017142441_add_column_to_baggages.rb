class AddColumnToBaggages < ActiveRecord::Migration[5.1]
  def change
    add_column :baggages, :name, :string
  end
end
