class CreateTenantImages < ActiveRecord::Migration[5.1]
  def change
    create_table :tenant_images do |t|
      t.string  :image
      t.text    :description
      t.integer :tenant_id
      t.boolean :is_primary
      t.timestamps
    end
  end
end
