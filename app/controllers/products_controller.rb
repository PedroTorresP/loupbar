class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /products or /products.json
  def index
    @products = Product.all.reverse()

    if request.query_parameters[:query] != nil
      @products = @products.select { |product| I18n.transliterate(product.name).downcase.include? I18n.transliterate(request.query_parameters[:query]).downcase  }

    end
    case request.query_parameters[:tri]
    when "Date décroissant"
      @products = @products.sort_by(&:date).reverse
    when "Date croissant"
      @products = @products.sort_by(&:date)
    when "Prix décroissant"
      @products = @products.sort_by(&:price).reverse
    when "Prix croissant"
      @products = @products.sort_by(&:price)
    end

    if request.query_parameters[:low_stock] != nil
      @products = Product.all.select { |product| product.quantity.to_i < product.min_stock.to_i && product.available  }

    end

    @products = Kaminari.paginate_array(@products).page(params[:page]).per(20)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.date = Date.today
    @product.available = true
    categoriesName = {}
    subcategoriesName = {}
    Category.all.each do |category|
      if category.available
        categoriesName[category.name] = category.id
      end
    end
    @categories = categoriesName
    Subcategory.all.each do |subcategory|
      if subcategory.available
        subcategoriesName[subcategory.name] = subcategory.id
      end
    end
    @subcategories = subcategoriesName

    if request.query_parameters[:id] != nil
      @copyProduct = Product.find_by_id(request.query_parameters[:id])
      @product.name = @copyProduct.name
      @product.description = @copyProduct.description
      @product.category_id = @copyProduct.category_id
      @product.subcategory_id = @copyProduct.subcategory_id
      @product.date = @copyProduct.date
      @product.price = @copyProduct.price
      @product.available = @copyProduct.available
    end

  end

  # GET /products/1/edit
  def edit
    categoriesName = {}
    subcategoriesName = {}
    Category.all.each do |category|
      if category.available
        categoriesName[category.name] = category.id
      end
    end
    @categories = categoriesName
    Subcategory.all.each do |subcategory|
      if subcategory.available
        subcategoriesName[subcategory.name] = subcategory.id
      end
    end
    @subcategories = subcategoriesName
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    i = 1
    while i < 8000 do
      @product = Product.new(product_params)
      @product.name = 'Test avec beaucoup de produits '+ i.to_s
      @product.category_id = rand(1..10)
      @product.save
      i = i + 1
    end


    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: "Le produit a été créée." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: "Le produit a été modifié." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    if @product.id != 1
      @orders = Order.select {|order| order.product_id == @product.id}
      @wishlist = Wishlist.select {|wish| wish.product_id == @product.id}
      @orders.each do |order|
        order.product_id = 1
        order.save
      end
      @wishlist.each do |wish|
        wish.product_id = 1
        wish.save
      end
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: "Le produit a été supprimé." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:id, :name, :category_id, :subcategory_id, :description, :price, :image_path, :quantity, :min_stock, :available, :image, :date )
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
