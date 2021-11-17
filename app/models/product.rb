class Product < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search,
                  against: [:name, :sku],
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :supplier
  belongs_to :category

  scope :by_category, -> (category_id) { where(category_id: category_id) }
  scope :name_asc, -> { order(:name) }

  validates :sku, uniqueness: true
end
