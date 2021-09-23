class EvenementsController < ApplicationController
  def index
    @events = Event.all
  end

  def evenement
    @event = Event.find_by_id(request.query_parameters[:id])
  end
end
