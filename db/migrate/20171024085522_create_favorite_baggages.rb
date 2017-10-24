class CreateFavoriteBaggages < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_baggages do |t|
      t.belongs_to :baggage, index: true
      t.belongs_to :favorite, index: true
      t.timestamps
    end
  end
end
