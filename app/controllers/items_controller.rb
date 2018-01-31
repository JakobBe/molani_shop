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

  private

  def flat_params
    params.require(:category).permit(:category)
  end

end
