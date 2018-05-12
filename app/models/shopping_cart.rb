class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def shoppincart_list(cart_items)
    list = []
    cart_items.each do |item|
      if list[].include? item
        item.count += 1
      else
        list << item
      end
    end
    return list
  end
end
