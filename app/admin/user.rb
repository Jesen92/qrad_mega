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
      f.input :admin
      f.input :veeam_user, label: 'Proba zatražena'
      f.input :offer_interest, label: 'Ponuda zatražena'
      f.input :spam_indicator
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :encrypted_password
      row :reset_password_token
      row :reset_password_sent_at
      row :remember_created_at
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_at
      row :current_sign_in_at
      row :current_sign_in_ip
      row :last_sign_ip
      row :created_at
      row :updated_at
      row :first_name
      row :last_name
      row :country
      row :city
      row :address
      row :company
      row :cin
      row :phone
      row :admin
      row :postal_code
      row('Proba zatražena') { |b| status_tag b.veeam_user }
      row('Ponuda zatražena') { |b| status_tag b.offer_interest }
      row :spam_indicator
      row :comment
    end
  end

end
