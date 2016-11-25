class Service < ActiveRecord::Base
  has_many :users_services
  has_many :subscribers
end
