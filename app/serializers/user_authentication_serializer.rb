class UserAuthenticationSerializer < ActiveModel::Serializer
  attributes :email, :first_name, :last_name, :id, :token

  def token
    object.authentication_token
  end
end