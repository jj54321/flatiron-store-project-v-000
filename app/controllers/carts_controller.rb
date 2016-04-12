class CartsController < ApplicationController

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout_cart
    redirect_to cart_path(@cart)
  end



end
