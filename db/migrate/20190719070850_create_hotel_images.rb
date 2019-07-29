class CreateHotelImages < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_images do |t|
      t.string  :image
      t.text    :description
      t.integer :hotel_id
      t.boolean :is_primary
      t.timestamps
    end
  end
end
