class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_created.subject
  #
  def order_created()
    @order = params[:order]
    @products = Buy.all.find_all { |buy| buy.order_id == 1}
    @total = 1
    @greeting = "Hi"

    mail to: @order.user.email, subject: "Confirmation de la commande "+@order.id.to_s
  end
end
