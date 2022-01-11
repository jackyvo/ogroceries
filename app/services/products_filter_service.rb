class ProductsFilterService
  def initialize params
    @params = params
  end

  def run
    products = Product.all
    filter_by products, @params
  end

  private ##


  def filter_by products, params
    if params[:categories].present?
      products = products.joins(:categories)
                         .where('categories.id IN (?)', params[:categories])
    end

    if params[:q].present?
      products = products.where(
        "name iLike :q OR sku iLike :q", q: "%#{params[:q]}%"
      )
    end

    products
  end
end