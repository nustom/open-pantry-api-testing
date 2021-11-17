class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :sku

  belongs_to :supplier
  belongs_to :category
end
