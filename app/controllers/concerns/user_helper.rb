module UserHelper
  extend ActiveSupport::Concern
  def current_user
    user = User.find_by(uuid: params[:uuid])
    if user.nil?
      if params[:is_released] == "false"
        user = User.create(uuid: params[:uuid], is_released: false)
      else
        user = User.create(uuid: params[:uuid])
      end
    end
    return user
  end
end