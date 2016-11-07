class CreateUsersServices < ActiveRecord::Migration
  def change
    create_table :users_services do |t|
      t.integer :user_id
      t.integer :service_id
      t.boolean :veeam
      t.boolean :back_up
      t.boolean :DR
      t.integer :VM
      t.integer :RAM

      t.timestamps null: false
    end
  end
end
