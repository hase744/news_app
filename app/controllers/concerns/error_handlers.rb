module ErrorHandlers
    extend ActiveSupport::Concern

included do
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAdressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
    rescue_from ActionController::RoutingError, with: :rescue404
    rescue_from ActionController::ParameterMissing, with: :rescue400
end

    private def rescue400(e)
        @error = e
        create_error_log(e)
        #render "errors/bad_request", status:  400, layout: "alert"
    end

    private def rescue403(e)
        @error = e
        create_error_log(e)
        #render "errors/forbidden", status: 403, layout: "alert"
    end

    def rescue404
        render "errors/not_found", status: 404, layout: "alert"
    end

    private def rescue500(e)
        @error = e
        create_error_log(e)
        #render "errors/internal_server_error", status: 500, layout: "alert"
    end
end