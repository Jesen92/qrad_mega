class AddFreeTrialRequestedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :free_trial_requested, :boolean
  end
end
