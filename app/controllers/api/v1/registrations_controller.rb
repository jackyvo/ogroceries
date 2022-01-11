module Api::V1
  class RegistrationsController < BaseController
    include RegistrationsDoc
    skip_before_action :authenticate_with_token!, only: [:create]
    
    def create
      user = User.new(user_params)

      if user.save
        render json: user, serializer: UserAuthenticationSerializer
      else
        render_error(user.errors)
      end
    end

    private ##

    def user_params
      params.permit(
        :email, :password, :password_confirmation, 
        :first_name, :last_name, :phone, :address
      )
    end
  end
end
