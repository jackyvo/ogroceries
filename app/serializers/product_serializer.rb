class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :supplier, :price, :sku, :id, :categories

  def supplier
    object.supplier&.name
  end

  def categories
    object.categories.map(&:name)
  end
end