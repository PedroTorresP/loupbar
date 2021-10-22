# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_created
  def order_created
    OrderMailer.order_created
  end

  def order_sent
    OrderMailer.order_sent
  end

  def order_ready
    OrderMailer.order_ready
  end

  def order_created_notify
    OrderMailer.order_created_notify
  end

  def order_payment_notify
    OrderMailer.order_payment_notify
  end

end
