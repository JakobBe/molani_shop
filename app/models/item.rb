class Item < ApplicationRecord
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items


  # def self.item_in_cart
  #   # binding.pry
  #   CartItem.find_by(item_id: (params[:id])) ? true : false
  # end
end
