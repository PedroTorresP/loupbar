class EvenementsController < ApplicationController
  def index
    @events = Event.all.order(date: :desc)
  end

  def evenement
    @event = Event.find_by_id(request.query_parameters[:id])
    @participations = Participant.all.find_all { |participant| participant.user_id == current_user.id}
    @participations.each do |participe|
      if participe.event_id == @event.id
        @participe = true
        break
      end
    end
    @participant = Participant.new
    @participant.event_id = @event.id
    @participant.user_id = current_user.id
    @placeRestantes = @event.places - @event.participants.length
  end
end
