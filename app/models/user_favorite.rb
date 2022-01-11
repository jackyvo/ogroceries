class UserFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_product, class_name: 'Product', foreign_key: :product_id
end
