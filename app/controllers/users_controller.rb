class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authorize_admin
  

  # GET /users or /users.json
  def index
    @users = User.all

    if request.query_parameters[:user_name] != nil
      @users = @users.select { |user| (user.first_name.downcase+" "+user.last_name.downcase).include? request.query_parameters[:user_name].downcase  }

    end
    if request.query_parameters[:user_mail] != nil
      @users = @users.select { |user| user.email.downcase.include? request.query_parameters[:user_mail].downcase  }

    end
    if request.query_parameters[:user_id] != nil && request.query_parameters[:user_id] != ""
      @users = @users.select { |user| user.id == request.query_parameters[:user_id].to_i  }
    end
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(20)

  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "L'utilisateur a été créée." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "L'utilisateur a été modifié." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.id != 1
      @orders = Order.select {|order| order.user_id == @user.id}
      @participants = Participant.select {|participant| participant.user_id == @user.id}
      @orders.each do |order|
        order.user_id = 3
        order.save
      end
      @participants.each do |participant|
        participant.user_id = 3
        participant.save
      end
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "L'utilisateur a été supprimé." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      p '--------------set----------------'
      p params[:id]
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :username, :password, :email, :first_name, :last_name, :postal_code, :city, :address, :phone, :is_admin)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
  
end
