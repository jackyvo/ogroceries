module Api::V1
  class SessionsController < BaseController
    include SessionsDoc
    skip_before_action :authenticate_with_token!, only: [:create]

    def create
      user = User.find_by(email: user_email)
      
      if user.present? && user.valid_password?(user_password)
        user.generate_authentication_token!
        user.save
        
        render json: user, serializer: UserAuthenticationSerializer
      else
        render_error('Invalid email or password')
      end
    end

    def destroy
      (head 404 and return) unless current_user.present?
      current_user.update authentication_token: nil
      render_success
    end

    private ##

    def user_params
      params.permit(:email, :password)
    end

    def user_email
      user_params[:email]
    end

    def user_password
      user_params[:password]
    end
  end
end
