class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :picture_path
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.decimal :VM_price, precision: 10, scale: 2
      t.decimal :storage_price, precision: 10, scale: 2
      t.string :storage_default
      t.string :RAM_default

      t.timestamps null: false
    end
  end
end
