class VeeamUser < ActiveRecord::Base
  has_many :users_services
end
