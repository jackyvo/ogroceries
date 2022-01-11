class User < ApplicationRecord
  include UserAuthentication
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_favorites
  has_many :favorite_products, through: :user_favorites, class_name: 'Product'
end
