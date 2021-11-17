class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.belongs_to :category
      t.belongs_to :supplier

      t.timestamps
    end
  end
end
