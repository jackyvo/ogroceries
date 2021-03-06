module UserAuthentication
  extend ActiveSupport::Concern

  included do
    before_create :generate_authentication_token!

    def generate_authentication_token!
      begin
        self.authentication_token = Devise.friendly_token
      end while self.class.exists?(authentication_token: authentication_token)
    end
  end
end