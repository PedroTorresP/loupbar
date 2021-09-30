class CartsController < ApplicationController
  include CartsHelper

  def show
    @cart = session_cart
  end

  def commander
    @cart = session_cart
    @user = User.all.find(current_user.id)
  end

  def create
    @cart = session_cart
    @user = User.all.find(current_user.id)
    @order = Order.new()
    @order.user_id = @user.id
    @order.payment = params[:payment]
    @order.shipping = params[:shipping]
    @order.save

    @cart.line_items.each do |item|
      @buy = Buy.new()
      @buy.order_id = @order.id
      @buy.product_id = item.product_id
      @buy.quantity = item.quantity
      @buy.save
    end
    redirect_to compte_commandes_detail_path + "?id=" + @order.id.to_s, notice: "La commande a été crée."
    session_cart.destroy
    session[:cart_id] = nil
  end

  def destroy
    session_cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  def cart_params
    params.require(:order).permit(:shipping, :payment)
  end
  
end
