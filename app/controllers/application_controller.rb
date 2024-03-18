class ApplicationController < ActionController::Base
  class Forbidden < ActionController::ActionControllerError; end
  class IpAdressRejected < ActionController::ActionControllerError; end
  include ErrorHandlers if Rails.env.production?

  def create_error_log(e)
    @error_log = ErrorLog.new(
      error_class: e.class,
      error_message: e.message,
      error_backtrace: e.backtrace,
      request_method: request.method,
      request_controller: controller_name, 
      request_action: action_name, 
      request_id_number: params[:id], 
      request_parameter: params, 
      )
    if @error_log.save
      @error_log
    end
  end

end
