# Create suppliers
suppliers = []
5.times.each do |i|
  suppliers << Supplier.create(name: "Supplier #{i + 1}")
end


# Create category and its product

5.times.each do |i|
  category = Category.create(name: "Category #{i + 1}")

  products = []
  5.times.each do |j|
    products << {name: "Product #{j + 1} of Category #{i + 1}", sku: "sku #{i + 1}#{j + 1}", supplier: suppliers.sample}
  end
  category.products.create(products)
end
