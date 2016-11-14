class CreateUsersServices < ActiveRecord::Migration
  def change
    create_table :users_services do |t|
      t.integer :veeam_user_id
      t.integer :vm_server_id
      t.integer :services_id
      t.integer :vm_extra
      t.integer :storage_extra

      t.timestamps null: false
    end
  end
end
