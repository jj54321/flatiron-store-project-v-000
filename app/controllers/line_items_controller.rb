class LineItemsController < ApplicationController

  def create
    if current_user.current_cart
      @cart = current_user.current_cart
    else
      @cart = Cart.create
      @cart.user = current_user
      current_user.current_cart = @cart
      current_user.save
      @cart.save
    end
    @item = Item.find_by_id(params[:item_id])
    new_line = @cart.add_item(@item.id)
    new_line.save
    redirect_to cart_path(@cart)
  end

end
