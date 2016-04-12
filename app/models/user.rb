class User < ActiveRecord::Base
  has_many :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable


  def current_cart=(cart)
    self.current_cart_id = cart.id if cart
    @current_cart = cart
    self.save
  end

  def current_cart
    @current_cart = Cart.find_by(id: self.current_cart_id)
  end
end
