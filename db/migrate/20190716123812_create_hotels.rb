class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string    :name
      t.string    :address
      t.string    :phone
      t.integer   :rating
      t.text      :description
      t.string    :permalink
      t.timestamps
    end
  end
end
