ActiveAdmin.register Channel do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :youtube_id, :url, :total_views, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :youtube_id, :url, :total_views, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column :id
    column :title do |model|
      link_to(model.name, model.url)
    end
    column :total_views
    column :description

    actions
    #column :is_deleted
    #default_actions
  end
end
