module Api::V1
  class FavoritesController < BaseController
    include FavoritesDoc

    def create
      user = current_user
      product = Product.find_by(id: params[:id])

      if user.favorite_products.include? product
        user.favorite_products.delete product
      else
        user.favorite_products << product
      end

      render_favorites
    end

    def index
      render_favorites
    end

    private ##

    def render_favorites
      render json: current_user.favorite_products, 
                                each_serializer:FavoriteSerializer
    end
  end
end
