ActiveAdmin.register Press do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :category_id, :youtube_ids, :news_json, :is_published
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_id, :youtube_ids, :news_json, :is_published]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :category
    column :youtube_ids
    column :is_published

    actions
  end
  
end
