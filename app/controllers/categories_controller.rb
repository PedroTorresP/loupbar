class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /categories or /categories.json
  def index
    @categories = Category.all
    @categories = Kaminari.paginate_array(@categories).page(params[:page]).per(20)
    categoriesName = {}
    Category.all.each do |category|
      if category.available
        categoriesName[category.name] = category.id
      end
    end
    @categoriesList = categoriesName
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    @category.available = true
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "La catégorie a été créée." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "La catégorie a été modifiée." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    if @category.id > 1
    if @category.id == category_params[:id].to_i
      newID = 1
    else
      newID = category_params[:id].to_i
    end
    @products = Product.select {|product| product.category_id == @category.id }
    @products.each  do |product|
      product.category_id = newID
      product.save
    end
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "La catégorie a été supprimée." }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:id, :name, :available)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
