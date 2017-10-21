class CreateRentalUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_users do |t|
      t.belongs_to :user, index: true
      t.timestamps
    end
    change_table :baggages do |t|
      t.belongs_to :rental_user, index: true
    end
  end
end
