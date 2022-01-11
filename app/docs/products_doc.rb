module ProductsDoc
  extend Apipie::DSL::Concern
  
  ###################################################################
  api :GET, '/products', 'Get all products and filter by categories, name or sku'

  param :q, String, desc: 'Filter by name or sku', required: false
  param :categories, Array, desc: 'Filter by category ids', required: false

  description <<-EOS
  Authorization: Token token=EevNaQ9-ioCQQytz9PCC
  EOS

  example <<-EOS
  [
    {
        "name": "Test",
        "description": null,
        "supplier": "A1",
        "price": 100,
        "sku": "product123",
        "id": 1,
        "categories": [
            "Cat 1",
            "Cat 2"
        ]
    },
    {
        "name": "Test",
        "description": null,
        "supplier": "A1",
        "price": 200,
        "sku": "product123",
        "id": 2,
        "categories": []
    },
    {
        "name": "Test",
        "description": null,
        "supplier": "A1",
        "price": 200,
        "sku": "product13",
        "id": 3,
        "categories": []
    }
  ]
  EOS
  def index;end
end