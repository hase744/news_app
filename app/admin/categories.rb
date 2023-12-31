ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :japanese_name, :word, :description, :is_default, :start_at, :end_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :japanese_name, :word, :description, :start_at, :end_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
