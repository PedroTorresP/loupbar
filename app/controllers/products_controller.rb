class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /products or /products.json
  def index
    @products = Product.all.reverse()

    if request.query_parameters[:query] != nil
      @products = @products.select { |p| p.name.downcase.include? request.query_parameters[:query].downcase  }

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
      @products = Product.all.select { |p| p.quantity.to_i < p.min_stock.to_i && p.available  }

    end
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
    Category.all.each do |c|
      if c.available
        categoriesName[c.name] = c.id
      end
    end
    @categories = categoriesName
    Subcategory.all.each do |c|
      if c.available
        subcategoriesName[c.name] = c.id
      end
    end
    @subcategories = subcategoriesName
  end

  # GET /products/1/edit
  def edit
    categoriesName = {}
    subcategoriesName = {}
    Category.all.each do |c|
      if c.available
        categoriesName[c.name] = c.id
      end
    end
    @categories = categoriesName
    Subcategory.all.each do |c|
      if c.available
        subcategoriesName[c.name] = c.id
      end
    end
    @subcategories = subcategoriesName
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: "Le produit a été crée." }
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
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Le produit a été supprimé." }
      format.json { head :no_content }
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
      #redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
