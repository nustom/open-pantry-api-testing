require 'rails_helper'

describe 'Api::V1::FavoriteProductsController', type: :request do

  let (:user) { create_user }
  let (:login_url) { '/api/v1/login' }
  let (:favorite_products_url) { '/api/v1/favorite_products' }

  context 'When logged in' do
    context 'When get list of favorite products' do
      it 'returns 200' do
        get favorite_products_url, headers: Devise::JWT::TestHelpers.auth_headers({}, user)
        expect(response.status).to eq(200)
      end

      it 'returns only favorite products' do
        products = create_list(:product, 2)
        user.add_favorite(products.first)
        get favorite_products_url, headers: Devise::JWT::TestHelpers.auth_headers({}, user)

        expect(json['products'].size).to eq(1)
        expect(json['products'][0]['name']).to eq(products.first.name)
      end
    end

    context 'When add a product to favorite list' do
      it 'returns 201' do
        product = create(:product)
        post favorite_products_url,
              params: { product_id: product.id },
              headers: Devise::JWT::TestHelpers.auth_headers({}, user)

        expect(response.status).to eq(201)
      end

      it 'return 404 if product not found' do
        post favorite_products_url,
              params: { product_id: -1 },
              headers: Devise::JWT::TestHelpers.auth_headers({}, user)

        expect(response.status).to eq(404)
      end
    end

    context 'When remove a product from favorite list' do
      it 'returns 200' do
        product = create(:product)
        user.add_favorite(product)
        delete favorite_product_path(product),
              headers: Devise::JWT::TestHelpers.auth_headers({}, user)

        expect(response.status).to eq(200)
      end
    end
  end

  context 'When not logged in' do
    context 'When get list of favorite products' do
      before do
        get favorite_products_url
      end

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end

    context 'When add a product to favorite list' do
      before do
        get favorite_products_url
      end

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end

    context 'When remove a product from favorite list' do
      before do
        delete favorite_product_path(-1)
      end

      it 'returns 401' do
        expect(response.status).to eq(401)
      end
    end
  end

end
