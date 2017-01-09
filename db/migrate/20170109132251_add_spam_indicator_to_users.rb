class AddSpamIndicatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :spam_indicator, :boolean
  end
end
