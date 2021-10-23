class ContactController < ApplicationController
  def index
  end

  def send_mail
    p '-------------------------------------------------------------'
    #p params[:message]
    ContactMailer.with(order: 'abc').contact.deliver_later
    redirect_to root_path
  end


  def contact_params
    params.permit(:message)
  end
end
