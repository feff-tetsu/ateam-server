class AddAttachmentImageToBaggage < ActiveRecord::Migration[5.1]
  def change
    change_table :baggages do |t|
      t.attachment :image
    end
  end
end
