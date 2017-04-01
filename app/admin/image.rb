ActiveAdmin.register Image do

  permit_params :title, :user_id, :file

  index do
    selectable_column
    id_column
    column :file do |image|
      image_tag image.file_url(:thumb)
    end
    column :title
    column :user_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :file
      f.input :user_id
      f.input :file, :as => :file, :hint => image_tag(f.object.file.url(:thumb))
    end
    f.actions
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
