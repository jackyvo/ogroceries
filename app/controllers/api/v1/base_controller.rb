module Api::V1
  class BaseController < ActionController::API
    include Authenticable
    include ActionController::Serialization

    before_action :authenticate_with_token!

    # exception catching ##
    rescue_from Exception do |exception|
      render json: { error: exception.message }, status: 500
    end

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    rescue_from CanCan::AccessDenied do |_exception|
      render json: {
        error: 'Access is denied'
      }, status: 403
    end

    private ##

    def render_error(errors, code=422)
      render json: { error: [*errors].to_sentence }, status: code
    end

    def render_success(msg=[])
      render json: { message: [*msg].to_sentence }, status: 200
    end

    def render_not_found msg=nil
      render json: { error: msg || 'Record not found' }, status: 404
    end
  end
end
