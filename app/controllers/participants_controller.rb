class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[ show edit update destroy ]
  before_action :authorize_admin
  helper :all

  # GET /participants or /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1 or /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
    @participant.event_id = request.query_parameters[:event]
    @users = User.all.collect { |u| [u.first_name + " " + u.last_name , u.id] }
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants or /participants.json
  def create
    @participant = Participant.new(participant_params)

    redirect_link = events_path + "/" + @participant.event_id.to_s
    respond_to do |format|
      if @participant.save
        format.html { redirect_to redirect_link, notice: "Le participant a été crée." }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update

    redirect_link = events_path + "/" + @participant.event_id.to_s
    respond_to do |format|
      if @participant.update(participant_params_update)
        format.html { redirect_to redirect_link, notice: "Le participant a été modifié." }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    redirect_link = events_path + "/" + @participant.event_id.to_s
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to redirect_link, notice: "Le participant a été supprimé." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:id, :user_id, :event_id, :is_paid)
    end

    def participant_params_update
      params.permit(:id, :user_id, :event_id, :is_paid)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
