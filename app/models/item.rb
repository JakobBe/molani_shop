class Item < ApplicationRecord
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
end
