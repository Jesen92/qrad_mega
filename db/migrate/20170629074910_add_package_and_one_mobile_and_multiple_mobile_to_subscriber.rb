class AddPackageAndOneMobileAndMultipleMobileToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :package, :string
    add_column :subscribers, :one_mobile, :integer
    add_column :subscribers, :multiple_mobile, :integer
  end
end
