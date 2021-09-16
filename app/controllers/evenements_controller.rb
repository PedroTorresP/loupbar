class EvenementsController < ApplicationController
  def index
    @events = Event.all
  end
end
