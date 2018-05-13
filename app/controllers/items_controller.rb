require "pry-byebug"

class ItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def category
    @items = Item.where(category: params[:category])
  end

  # def self.item_in_cart
  #   # binding.pry
  #   CartItem.find_by(item_id: (params[:id])) ? true : false
  # end

  private

  def flat_params
    params.require(:category).permit(:category)
  end

end
