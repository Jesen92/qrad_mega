class AddPackageAndOneMobileAndMultipleMobileToServices < ActiveRecord::Migration
  def change
    add_column :services, :package, :string
    add_column :services, :one_mobile, :integer
    add_column :services, :multiple_mobile, :integer
  end
end
