class AddPhotoUrlToBaggage < ActiveRecord::Migration[5.1]
  def change
    add_column :baggages, :photo_url, :string, default: 'https://s3-ap-northeast-1.amazonaws.com/ateam-demoapp/22318900039_d7233ca6d1_q.jpg'
  end
end
