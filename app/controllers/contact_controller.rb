class ContactController < ApplicationController
  prepend_before_action :check_captcha, except: [:index]

  def index
  end

  def send_mail
    ContactMailer.with(sender: contact_params[:email], subject: contact_params[:subject], message: contact_params[:message]).contact.deliver_later
    redirect_to root_path, notice: "Le message a été envoyé." 
  end


  def contact_params
    params.permit(:message, :subject, :email)
  end

  def check_captcha
    unless verify_recaptcha
      if params['g-recaptcha-response'] == 'true'
        send_mail()
      else
        redirect_to contact_path, notice: "Erreur captcha."
      end
      
    end
  end
end
