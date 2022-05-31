class BlacklistsController < ApplicationController
  before_action :set_blacklist, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /blacklists or /blacklists.json
  def index
    @blacklists = Blacklist.all
  end

  # GET /blacklists/1 or /blacklists/1.json
  def show
  end

  # GET /blacklists/new
  def new
    @blacklist = Blacklist.new
  end

  # GET /blacklists/1/edit
  def edit
  end

  # POST /blacklists or /blacklists.json
  def create
    @blacklist = Blacklist.new(blacklist_params)

    respond_to do |format|
      if @blacklist.save
        format.html { redirect_to users_path, notice: "L'IP a été banni." }
        format.json { render :show, status: :created, location: @blacklist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blacklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blacklists/1 or /blacklists/1.json
  def update
    respond_to do |format|
      if @blacklist.update(blacklist_params)
        format.html { redirect_to @blacklist, notice: "Blacklist was successfully updated." }
        format.json { render :show, status: :ok, location: @blacklist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blacklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blacklists/1 or /blacklists/1.json
  def destroy
    @blacklist.destroy
    respond_to do |format|
      format.html { redirect_to blacklists_url, notice: "Blacklist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blacklist
      @blacklist = Blacklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blacklist_params
      params.require(:blacklist).permit(:ip)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
