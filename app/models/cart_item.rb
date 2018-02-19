class CartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :item
end
