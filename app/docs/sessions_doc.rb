module SessionsDoc
  extend Apipie::DSL::Concern

  api :POST, '/login', 'Login API'

  
  param :email, String, desc: 'Email of user', required: true
  param :password, String, desc: 'Password of user', required: true

  # ERROR CODES with description
  error 401, "Bad Credentials"
  error 500, "Server crashed"
  error 404, "Missing"
  error 422, "Errors. Response {errors: 'string of error'}"

  # FULL DESCRIPTION: How it work, ...
  description <<-EOS
    == Header
    == Long description
      User login
    == How it work
      User login
  EOS
  def create;end

  ###################################################################
  api :DELETE, '/logout', 'Logout API'
  error 401, "Bad Credentials"
  error 500, "Server crashed"
  error 404, "Missing"
  error 422, "Errors. Response {errors: 'string of error'}"

  # FULL DESCRIPTION: How it work, ...
  description <<-EOS
    == Header
      Authorization Token token
    == Long description
      User logout
    == How it work
      User logout
  EOS

  # Data example of return
  example <<-EOS
  {
    "status": "OK"
  }
  EOS
  def destroy;end
end