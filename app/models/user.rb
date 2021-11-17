class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

	has_many :favorites, dependent: :destroy
	has_many :favorite_products, through: :favorites, source: :product

	 def add_favorite(product)
    favorites.create(product: product) unless favorites.exists?(product: product)
  end

  def remove_favorite(product)
    favorites.where(product: product).destroy_all
  end
end
