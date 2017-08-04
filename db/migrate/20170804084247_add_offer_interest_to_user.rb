class AddOfferInterestToUser < ActiveRecord::Migration
  def change
    add_column :users, :offer_interest, :boolean
  end
end
