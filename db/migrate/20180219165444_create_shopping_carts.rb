class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.integer :total_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
