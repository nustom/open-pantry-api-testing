class Api::V1::ProductsController < Api::BaseController
  skip_before_action :authenticate_user!

  def index
    result = ProductService.index(params)

    render json: result
  end
end
