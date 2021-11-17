class Api::V1::FavoriteProductsController < Api::BaseController
  before_action :find_product, only: [:create, :destroy]

  def index
    render json: { products: ActiveModel::SerializableResource.new(current_user.favorite_products.name_asc) }
  end


  def create
    current_user.add_favorite(@product)

    head :created
  end

  def destroy
    current_user.remove_favorite(@product)

    head :ok
  end

  private
  def find_product
    @product = Product.find(params[:product_id] || params[:id])
  end
end
