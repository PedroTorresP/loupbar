class CustomisationsController < ApplicationController
  before_action :set_customisation, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /customisations or /customisations.json
  def index
    @customisations = Customisation.all
  end

  # GET /customisations/1 or /customisations/1.json
  def show
  end

  # GET /customisations/new
  def new
    @customisation = Customisation.new
  end

  # GET /customisations/1/edit
  def edit
  end

  # POST /customisations or /customisations.json
  def create
    @customisation = Customisation.new(customisation_params)

    respond_to do |format|
      if @customisation.save
        format.html { redirect_to @customisation, notice: "Customisation was successfully created." }
        format.json { render :show, status: :created, location: @customisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customisations/1 or /customisations/1.json
  def update
    respond_to do |format|
      if @customisation.update(customisation_params)
        format.html { redirect_to customisations_path, notice: "Customisation was successfully updated." }
        format.json { render :show, status: :ok, location: @customisation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customisations/1 or /customisations/1.json
  def destroy
    @customisation.destroy
    respond_to do |format|
      format.html { redirect_to customisations_url, notice: "Customisation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customisation
      @customisation = Customisation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customisation_params
      params.require(:customisation).permit(:name, :image, :value)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
