class AddVeeamUserIdAndServiceIdAndVmServerIdAndVmExtraAndStorageExtraToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :veeam_user_id, :integer
    add_column :subscribers, :service_id, :integer
    add_column :subscribers, :vm_server_id, :integer
    add_column :subscribers, :vm_extra, :integer
    add_column :subscribers, :storage_extra, :integer
  end
end
