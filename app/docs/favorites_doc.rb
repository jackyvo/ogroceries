module FavoritesDoc
  extend Apipie::DSL::Concern
  
  ###################################################################
  api :GET, '/favorites', 'Get all user favorite products'

  description <<-EOS
  Authorization: Token token=EevNaQ9-ioCQQytz9PCC
  EOS

  example <<-EOS
  [
    {
        "id": 1,
        "name": "Test",
        "sku": "product123"
    }
  ]
  EOS
  def index;end

  ###################################################################
  api :POST, '/favorites', 'Add product to user favorite'
  param :id, Integer, 'Id of the product'

  description <<-EOS
  Authorization: Token token=EevNaQ9-ioCQQytz9PCC
  EOS

  example <<-EOS
  [
    {
        "id": 1,
        "name": "Test",
        "sku": "product123"
    }
  ]
  EOS
  def create;end
end