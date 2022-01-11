module Authenticable
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def current_user
    @user
  end

  def authenticate_with_token!
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      @user = User.find_by(authentication_token: token)
    end
  end

  def render_unauthorized(realm = 'Application')
    headers['WWW-Authenticate'] = %(Token realm="#{realm.gsub(/"/, '')}")
    render json: { error: 'Bad credentials' }, status: :unauthorized
  end
end
