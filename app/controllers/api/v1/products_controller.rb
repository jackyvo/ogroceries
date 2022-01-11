module Api::V1
  class ProductsController < BaseController
    include ProductsDoc

    def index
      products = ProductsFilterService.new(params).run
      render json: products
    end
  end
end