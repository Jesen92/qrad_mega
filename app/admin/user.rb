ActiveAdmin.register User do

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
  permit_params :email, :password, :password_confirmation, :admin, :veeam_user, :spam_indicator

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :admin
    column :spam_indicator
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :spam_indicator
  filter :admin

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :country
      f.input :city
      f.input :address
      f.input :postal_code
      f.input :company
      f.input :cin, label: "Company identification number / OIB"
      f.input :phone
      f.input :free_trial_requested, label: "Poslan upit za probom"
      f.input :admin
      f.input :veeam_user, label: 'Proba'
      f.input :offer_interest, label: 'Ponuda'
      f.input :spam_indicator
    end
    f.actions
  end

end
