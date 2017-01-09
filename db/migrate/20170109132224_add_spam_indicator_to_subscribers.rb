class AddSpamIndicatorToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :spam_indicator, :boolean
  end
end
