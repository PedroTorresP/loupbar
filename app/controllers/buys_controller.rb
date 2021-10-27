class BuysController < ApplicationController
  before_action :set_buy, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /buys or /buys.json
  def index
    @buys = Buy.all
  end

  # GET /buys/1 or /buys/1.json
  def show
  end

  # GET /buys/new
  def new
    @buy = Buy.new
    @buy.order_id = request.query_parameters[:order]
    if request.query_parameters[:query] != nil
      @products = Product.all.select { |product| I18n.transliterate(product.name).downcase.include? I18n.transliterate(request.query_parameters[:query]).downcase  }
    else
      @products = Product.all
    end
    @products = @products.collect { |product| [product.name.to_s + ' - ' + product.quantity.to_s + ' disponible', product.id] }
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys or /buys.json
  def create
    @buy = Buy.new(buy_params)
    @product = @buy.product
    @buy.price = @product.price
    @product.quantity -= @buy.quantity
    @product.save
    redirect_link = orders_path + "/" + @buy.order_id.to_s
    respond_to do |format|
      if @buy.save
        format.html { redirect_to redirect_link, notice: "Buy was successfully created." }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1 or /buys/1.json
  def update
    @buy_update = Buy.all.find(params[:id])
    @product = @buy_update.product
    if @product.quantity > 0 && !@product.available || params[:quantity].to_i == -1 || @product.available
      if @buy_update.quantity + params[:quantity].to_i == 0
          @product.quantity -= params[:quantity].to_i
          @product.save
          @buy_update.destroy
      else
          @buy_update.quantity += params[:quantity].to_i
          @product.quantity -= params[:quantity].to_i
          @product.save
          @buy_update.save
      end
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /buys/1 or /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: "Buy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buy_params
      params.require(:buy).permit(:id, :order_id, :product_id, :quantity)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
