class Service < ActiveRecord::Base
  has_many :users_services
  has_many :users, :through => :users_services
end
