class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string    :name
      t.text      :address
      t.text      :description
      t.string    :url
      t.string    :image
      t.string    :permalink
      t.timestamps
    end
  end
end
