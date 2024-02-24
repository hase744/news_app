ActiveAdmin.register Summary do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :video_id, :order, :question, :answer
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :video_id, :order, :question, :answer]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column :id
    column :user
    column :order
    column :answer
    column :summarized_at

    actions
    #column :is_deleted
    #default_actions
  end
end
