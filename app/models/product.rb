class Product < ApplicationRecord
  belongs_to :supplier
  has_and_belongs_to_many :categories

  validates_presence_of :name, :sku, :price
  validates_uniqueness_of :sku
end
