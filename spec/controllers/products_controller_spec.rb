require 'rails_helper'

describe 'Api::V1::ProductsController', type: :request do

  let (:products_url) { '/api/v1/products' }

  context 'When get product list' do

    it 'returns all products' do
      create_list(:product, 30)
      get products_url
      expect(response.status).to eq(200)
      expect(json['products'].size).to eq(30)
    end

    it 'returns products match category' do
      create_list(:product, 10)
      category = create(:category)
      create(:product, category: category)
      get products_url, params: { category_id: category.id }
      expect(response.status).to eq(200)
      expect(json['products'].size).to eq(1)
      expect(json['products'][0]['category']['id']).to eq(category.id)
    end

    it 'returns products match search key' do
      create_list(:product, 10)
      uniq_name = Time.zone.now.to_i.to_s
      create(:product, name: uniq_name)
      get products_url, params: { search: uniq_name }
      expect(response.status).to eq(200)
      expect(json['products'].size).to eq(1)
      expect(json['products'][0]['name']).to eq(uniq_name)
    end

  end

end
