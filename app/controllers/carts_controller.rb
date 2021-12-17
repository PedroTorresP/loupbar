class CartsController < ApplicationController
  include CartsHelper

  def show
    @cart = session_cart
    @dateSortie = Date.today
    @cart.line_items.each do |item|
      if item.product.date > Date.today
        @preorder = true
        if item.product.date > @dateSortie 
          @dateSortie = item.product.date
        end
      elsif item.product.date <= Date.today
        @current = true
      end
    end
  end

  def commander
    @cart = session_cart
    @user = User.all.find(current_user.id)
    @order = Order.new()
    @shipping = cart_form_params[:shipping]
    @payment = cart_form_params[:payment]


  end

  def create
    @cart = session_cart
    @user = User.all.find(current_user.id)
    @order = Order.new()
    @order.payment = cart_params[:payment]
    @order.shipping = cart_params[:shipping]
    @order.is_paid = 0
    @order.is_ready = 0
    @order.user_id = @user.id
    @order.save


    @cart.line_items.each do |item|
      @buy = Buy.new()
      @buy.order_id = @order.id
      @buy.product_id = item.product_id
      @buy.price = item.product.price
      @buy.quantity = item.quantity
      @buy.save
      @product = Product.all.find_by_id(item.product_id)
      @product.quantity -= item.quantity
      @product.save
    end
    OrderMailer.with(order: @order).order_created.deliver_later
    OrderMailer.with(order: @order).order_created_notify.deliver_later
    redirect_to compte_commandes_detail_path + "?id=" + @order.id.to_s, notice: "La commande a été créée."
    session_cart.destroy
    session[:cart_id] = nil
  end

  def destroy
    session_cart.destroy
    session[:cart_id] = nil
    oldCarts = Cart.all.find_all {|cart| cart.created_at.before?(1.week.ago) }
    oldCarts.each do |cart|
      cart.destroy
    end
    redirect_to(root_path,  notice:'Le panier a été vidé')
  end

  def cart_form_params
    params.permit(:shipping, :payment)
  end

  def cart_params
    params.require(:order).permit(:shipping, :payment)
  end
  
end
