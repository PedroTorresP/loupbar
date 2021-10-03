class CompteController < ApplicationController
  def evenements
    @participations = Participant.all.find_all { |participant| participant.user_id == current_user.id}
  end

  def commandes
    @commandes = Order.all.find_all { |order| order.user_id == current_user.id}.reverse
  end

  def commandes_detail
    @commande = Order.all.find_by_id(request.query_parameters[:id])
    @produits = Buy.all.find_all { |buy| buy.order_id == @commande.id}
    @user = User.all.find(current_user.id)
  end

  def wishlist
    @wishlist = Wishlist.all.find_all{ |wish| wish.user_id == current_user.id}
    p @wishlist
  end

end
