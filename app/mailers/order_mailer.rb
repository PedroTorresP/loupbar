class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_created.subject
  #
  def order_created
    @order = params[:order]
    @buys = Buy.select { |buy| buy.order_id == @order.id}
    @total = order_total(@order)

    mail to: @order.user.email, reply_to: 'renaudrey1989@outlook.fr', subject: "Confirmation de la commande "+@order.id.to_s
  end

  def order_created_notify
    @order = params[:order]
    @buys = Buy.select { |buy| buy.order_id == @order.id}
    @total = order_total(@order)

    mail to: 'renaudrey1989@outlook.fr', subject: "Notification de création commande "+@order.id.to_s
  end

  def order_sent
    @order = params[:order]

    mail to: @order.user.email, reply_to: 'renaudrey1989@outlook.fr', subject: "Envoi de la commande "+@order.id.to_s
  end

  def order_ready
    @order = params[:order]
    @buys = Buy.select { |buy| buy.order_id == @order.id}
    @total = order_total(@order)
    mail to: @order.user.email, reply_to: 'renaudrey1989@outlook.fr', subject: "Commande "+@order.id.to_s+" prête à être retirée"
  end

  def order_payment_notify
    @order = params[:order]

    mail to: 'renaudrey1989@outlook.fr', subject: "La commande "+@order.id.to_s+" a été payée"
  end

  def order_total(order)
    sum = 0
    order.buys.each do |buy|
      sum+= buy.quantity * buy.price
    end
    if order.shipping == 'poste'
        sum += 7
    end
    if order.discount
        sum -= order.discount
    end
    return sum
  end
end
