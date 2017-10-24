class AddGenreToBaggages < ActiveRecord::Migration[5.1]
  def change
    add_column :baggages, :genre, :string, null: true
  end
end
