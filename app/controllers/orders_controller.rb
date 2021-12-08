class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authorize_admin
  include OrdersHelper

  # GET /orders or /orders.json
  def index
    @orders = Order.all.reverse

    if request.query_parameters[:customer_name] != nil
      @orders = @orders.select { |order| (order.user.first_name.downcase+" "+order.user.last_name.downcase).include? request.query_parameters[:customer_name].downcase  }

    end
    if request.query_parameters[:order_number] != nil && request.query_parameters[:order_number] != ""
      @orders = @orders.select { |order| order.id == request.query_parameters[:order_number].to_i  }
    end

    if request.query_parameters[:notfinished] != nil
      @orders = @orders.select { |order| order.is_ready != 'terminée' && order.is_ready != 'annulée'  }
    end

    @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(20)
  end

  # GET /orders/1 or /orders/1.json
  def show
    total = 0
    @order.buys.each do |buy|
      total += buy.quantity * buy.product.price
    end
    @totalOrder = total
    @totalOrderDiscount = order_total(@order).to_d - @order.discount.to_s.to_d
  end

  # GET /orders/new
  def new
    @order = Order.new
    @products = Product.all
    @order.payment = 0
    @order.shipping = 0
    @order.is_paid = 2
    @order.is_ready = 3
    @lst_payment = ['boutique','twint','paypal','virement']
    @lst_shipping = ['magasin','poste']
    @lst_is_paid = ['attente','validation','payée']
    @lst_is_ready = ['créée','prête','envoyée','terminée','annulée']
  end

  # GET /orders/1/edit
  def edit
    @lst_payment = ['boutique','twint','paypal','virement']
    @lst_shipping = ['magasin','poste']
    @lst_is_paid = ['attente','validation','payée']
    @lst_is_ready = ['créée','prête','envoyée','terminée','annulée']
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "La commande a été créée." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    if order_params[:is_ready] == 'prête'
      OrderMailer.with(order: @order).order_ready.deliver_later
    elsif order_params[:is_ready] == 'envoyée'
      OrderMailer.with(order: @order).order_sent.deliver_later
    elsif order_params[:is_ready] == 'annulée'
      @order.buys.each do |buy|
        product = buy.product
        product.quantity += buy.quantity
        product.save
      end
    end
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "La commande a été modifiée." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "La commande a été supprimée." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:id, :user_id, :discount, :is_paid, :is_ready, :payment, :shipping, :tracking, :comment_shop)
    end


    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
