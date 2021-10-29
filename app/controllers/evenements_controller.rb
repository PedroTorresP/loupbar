class EvenementsController < ApplicationController
  def index
    @events = Event.all.order(date: :desc)
    if request.query_parameters[:year] == nil
      request.query_parameters[:year] = Time.now.year
    end
    if request.query_parameters[:month] == nil
      request.query_parameters[:month] = Time.now.month
    end
    @events = @events.select do |event|
      p '----------------------'
      p event.date.year
      p request.query_parameters[:year].to_i
      event.date.year == request.query_parameters[:year].to_i
      event.date.month == request.query_parameters[:month].to_i
    end
    if request.query_parameters[:name] != nil && request.query_parameters[:name] != ""
      @events = Event.all.select { |event| I18n.transliterate(event.name).downcase.include? I18n.transliterate(request.query_parameters[:name]).downcase  }

    end

  end

  def evenement
    @event = Event.find_by_id(request.query_parameters[:id])
    if current_user != nil
      @participations = Participant.all.find_all { |participant| participant.user_id == current_user.id}
      @participations.each do |participe|
        if participe.event_id == @event.id
          @participe = true
          break
        end
      end
    end
    @participant = Participant.new
    @participant.event_id = @event.id
    @placeRestantes = @event.places - @event.participants.length
  end

  def create
    @participant = Participant.new(participant_params) 
    @event = @participant.event
    @placeRestantes = @event.places - @event.participants.length
    @participant.user_id = current_user.id
    @participant.save
    EventMailer.with(participant: @participant).event_inscription.deliver_later

    if @placeRestantes > 0
    redirect_link = evenements_path + "/evenement?id=" + @event.id.to_s
    respond_to do |format|
      if @participant.save
        format.html { redirect_to redirect_link, notice: "Vous avez été inscrit à l'évènement." }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end
  end


  def participant_params
    params.require(:participant).permit(:id, :event_id)
  end
end
