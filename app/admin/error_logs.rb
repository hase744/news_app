ActiveAdmin.register ErrorLog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :error_class, :error_message, :error_backtrace, :request_method, :request_controller, :request_action, :request_id_number, :request_parameter
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :error_class, :error_message, :error_backtrace, :request_method, :request_controller, :request_action, :request_id_number, :request_parameter]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :error_class
    column :request_method
    column :request_controller
    column :request_action

    actions
  end
  
end
