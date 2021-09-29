class CartsController < ApplicationController
  include CartsHelper

  def show
    @cart = session_cart
  end

  def destroy
    session_cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
