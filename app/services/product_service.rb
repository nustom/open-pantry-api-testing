class ProductService < BaseService
  class << self
    def index(params)
      scope = Product.includes(:supplier, :category)

      scope = scope.by_category(params[:category_id]) if params[:category_id].present?
      scope = scope.search(params[:search]) if params[:search].present?

      {
        products: ActiveModel::SerializableResource.new(scope)
      }
    end
  end
end
