ActiveAdmin.register Video do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :youtube_id, :second, :description, :title, :channel_id, :published_at, :total_views, :is_categorized
  permit_params :is_categorized
  #
  # or
  #
  # permit_params do
  #   permitted = [:youtube_id, :second, :description, :title, :channel_id, :published_at, :total_views, :is_categorized]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :title do |model|
      link_to(model.title, "https://www.youtube.com/watch?v=#{model.youtube_id}")
    end
    column :channel do |model|
      link_to(model.channel_name, "channels/#{model.channel.id}")
    end
    column :words do |model|
      model.video_categories.pluck(:words).each do |vc|
      end
    end
    column :total_views
    column :categories
    #column :description

    actions
    #column :is_deleted
    #default_actions
  end
end
