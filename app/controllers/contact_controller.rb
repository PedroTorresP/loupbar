class ContactController < ApplicationController
  def index
  end

  def send_mail
    ContactMailer.with(sender: contact_params[:email], subject: contact_params[:subject], message: contact_params[:message]).contact.deliver_later
    redirect_to root_path
  end


  def contact_params
    params.permit(:message, :subject, :email)
  end
end
