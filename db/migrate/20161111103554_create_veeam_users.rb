class CreateVeeamUsers < ActiveRecord::Migration
  def change
    create_table :veeam_users do |t|
      t.string :title
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
