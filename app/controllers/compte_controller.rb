class CompteController < ApplicationController
  def evenements
    @participations = Participant.all.find_all { |participant| participant.user_id == 3}
  end

  def commandes
    @commandes = Order.all.find_all { |order| order.user_id == 3}
  end
end
