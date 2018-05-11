require "pry-byebug"

class CartItemsController < ApplicationController
  def user_index
    if current_user.shopping_cart
      @cart_items = current_user.shopping_cart.cart_items
    else
      @cart_items = []
    end
    @total_price = 0
    @cart_items.each do |item|
      @total_price += item.item.price * item.count
    end
  end


  def item_there(item_id)
    CartItem.find_by(item_id: item_id) ? true : false
  end

  def create
    if current_user.shopping_cart && item_there(params[:item_id])
      cart_item = CartItem.find_by(item_id: params[:item_id])
      cart_item.count += 1
      cart_item.save
      redirect_to item_path(Item.find(params[:item_id]).id)
    elsif current_user.shopping_cart
      cart_item = CartItem.new
      cart_item.shopping_cart_id = current_user.shopping_cart.id
      cart_item.item_id = Item.find(params[:item_id]).id
      cart_item.count = 1
      cart_item.save
      redirect_to item_path(Item.find(params[:item_id]).id)
    else
      shopping_cart = ShoppingCart.create(user_id: current_user.id)
      cart_item = CartItem.new
      cart_item.shopping_cart_id = shopping_cart.id
      cart_item.item_id = Item.find(params[:item_id]).id
      cart_item.count = 1
      cart_item.save
      redirect_to item_path(Item.find(params[:item_id]).id)
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:cart_item_id])
    @cart_item.destroy
    redirect_to cart_items_user_index_path
  end
end
