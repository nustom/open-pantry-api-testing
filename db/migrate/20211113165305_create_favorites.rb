class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.belongs_to :product

      t.timestamps
    end

    add_index :favorites, [:user_id, :product_id], unique: true
  end
end
