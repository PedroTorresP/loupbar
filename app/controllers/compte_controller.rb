class CompteController < ApplicationController
  def evenements
    @participations = Participant.all.find_all { |participant| participant.user_id == current_user.id}
    @participations = @participations.sort_by{|participation| participation.event.date }.reverse
  end

  def commandes
    @commandes = Order.all.find_all { |order| order.user_id == current_user.id}.reverse
  end

  def commandes_detail
    @commande = Order.all.find_by_id(request.query_parameters[:id])
    check_user(@commande.user_id)
    @produits = Buy.all.find_all { |buy| buy.order_id == @commande.id}
    @user = User.all.find(current_user.id)
  end

  def commandes_paiement
    @order = Order.all.find_by_id(request.query_parameters[:id])
    check_user(@order.user_id)
  end

  def update
    @order = Order.find(compte_params['id'])
    check_user(@order.user_id)
    @order.update(compte_params)
    if compte_params[:is_paid] == 'validation'
      OrderMailer.with(order: @order).order_payment_notify.deliver_later
    end
    redirect_back(fallback_location: root_path)
  end

  def commandes_paiement_validation
    @order = Order.all.find_by_id(request.query_parameters[:id])
    status = request.query_parameters[:status]
    check_user(@order.user_id)
    if status == 'COMPLETED'
      @order.is_paid = 'validation'
      @order.save
    end
    redirect_to compte_commandes_paiement_path + '?id='+@order.id.to_s
  end

  def wishlist
    @wishlist = Wishlist.all.find_all{ |wish| wish.user_id == current_user.id}
  end

  def compte_params
    params.require(:order).permit(:id, :payment, :is_paid)
  end

  private
  def check_user(user_id)
    redirect_to(root_path) unless current_user.id == user_id
  end

end
