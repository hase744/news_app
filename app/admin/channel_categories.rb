ActiveAdmin.register ChannelCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :channel_id, :category_id, :is_absolute
  #
  # or
  #
  # permit_params do
  #   permitted = [:channel_id, :category_id, :is_absolute]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
