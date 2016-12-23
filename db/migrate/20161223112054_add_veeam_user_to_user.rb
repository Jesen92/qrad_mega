class AddVeeamUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :veeam_user, :boolean
  end
end
