module RegistrationsDoc
  extend Apipie::DSL::Concern

 ###################################################################
  api :POST, '/register', 'Register API'

  # PARAMS
  # PARAM <name>, <type>, description, required: true/false

  param :email, String, desc: 'Email of user', required: true
  param :password, String, desc: 'Password of user', required: true
  param :password_confirmation, String, desc: 'Password confirmation', required: true
  param :first_name, String, desc: 'First name', required: true
  param :last_name, String, desc: 'Last name', required: true
  param :phone, String, desc: 'Contact number', required: true
  param :school_id, Integer, desc: 'School id', required: true
  param :school_address, String, desc: 'School address', required: true

  # ERROR CODES with description
  error 401, "Bad Credentials"
  error 500, "Server crashed"
  error 404, "Missing"
  error 422, "Errors. Response {errors: {field: 'email', message: ''} }"

  # FULL DESCRIPTION: How it work, ...
  description <<-EOS
  {
    "first_name": "lee",
    "last_name": "thanh tiem",
    "email": "thanhtiemqt@gmail.com",
    "phone": "0968455455",
    "password": "12345678",
    "school_id": 1
  }
  EOS
  def create;end
end