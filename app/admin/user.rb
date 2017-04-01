ActiveAdmin.register User do

  permit_params :name, :email, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin, as: :boolean
      f.input :user, as: :boolean, :input_html => { :checked => 'checked' }
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :password
    column :admin
    column :user
    actions
  end
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

end
