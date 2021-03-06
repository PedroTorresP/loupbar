class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /subcategories or /subcategories.json
  def index
    @subcategories = Subcategory.all
    @subcategories = Kaminari.paginate_array(@subcategories).page(params[:page]).per(20)
    subcategoriesName = {}
    Subcategory.all.each do |subcategory|
      if subcategory.available
        subcategoriesName[subcategory.name] = subcategory.id
      end
    end
    @subcategoriesList = subcategoriesName
  end

  # GET /subcategories/1 or /subcategories/1.json
  def show
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
    @subcategory.available = true
  end

  # GET /subcategories/1/edit
  def edit
  end

  # POST /subcategories or /subcategories.json
  def create
    @subcategory = Subcategory.new(subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to @subcategory, notice: "Subcategory was successfully created." }
        format.json { render :show, status: :created, location: @subcategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcategories/1 or /subcategories/1.json
  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to @subcategory, notice: "Subcategory was successfully updated." }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1 or /subcategories/1.json
  def destroy
    if @subcategory.id > 1
    if @subcategory.id == subcategory_params[:id].to_i
      newID = 1
    else
      newID = subcategory_params[:id].to_i
    end


      @products = Product.select {|product| product.subcategory_id == @subcategory.id }
      @products.each  do |product|
        product.subcategory_id = newID
        product.save
      end
      @subcategory.destroy
      respond_to do |format|
        format.html { redirect_to subcategories_url, notice: "Subcategory was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subcategory_params
      params.require(:subcategory).permit(:id, :name, :available)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end

end
