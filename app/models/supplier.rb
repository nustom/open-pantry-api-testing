class Supplier < ApplicationRecord
  has_many :products, dependent: :nullify
end
