module UserHelper
  extend ActiveSupport::Concern
  def current_user
    user = User.find_by(uuid: params[:uuid])
    if user.nil?
      user = User.create(uuid: params[:uuid])
    end
    return user
  end
end