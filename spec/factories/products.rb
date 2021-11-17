FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    sku { Faker::Name.unique.name }

    supplier
    category
  end
end
