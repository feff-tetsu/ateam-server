class CreateCartsBaggages < ActiveRecord::Migration[5.1]
  def change
    create_table :carts_baggages do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :baggage, index: true
      t.timestamps
    end
  end
end
