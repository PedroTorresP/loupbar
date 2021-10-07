class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /events or /events.json
  def index
    @events = Event.all.reverse()
    if request.query_parameters[:event_name] != nil
      @events = @events.select { |e| e.name.downcase.include? request.query_parameters[:event_name].downcase  }
    end
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: "L'évènement a été crée." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: "L'évènement a été modifié." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "L'évènement a été supprimé." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:id, :name, :description, :image, :price, :places, :result, :date)
    end

    def authorize_admin
      redirect_to(root_path) unless current_user && current_user.is_admin?
    end
end
