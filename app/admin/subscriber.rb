ActiveAdmin.register Subscriber do

  permit_params :email, :spam_indicator
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    selectable_column
    id_column
    column :email
    column :spam_indicator
    actions
  end

  filter :email
  filter :spam_indicator
  filter :created_at
  filter :updated_at


  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :spam_indicator
    end
    f.actions
  end

end
