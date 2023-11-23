ActiveAdmin.register PdfFile do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :file
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :file]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :file do |model|
      link_to(model.title, "#{root_url(subdomain: false)}uploads/pdf_file/file/#{model.id}/#{model.title}.pdf")
    end
    column :updated_at
    column :created_at

    actions
  end
  
end

