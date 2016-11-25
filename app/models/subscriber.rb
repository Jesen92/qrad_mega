class Subscriber < ActiveRecord::Base
  belongs_to :service
  belongs_to :veeam_user
  belongs_to :vm_server
end
