class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  layout false

  def contact
    @sender = params[:sender]
    @subject = params[:subject]
    @content = params[:message]

    mail to: 'renaudrey1989@outlook.fr', reply_to: @sender,  subject: @subject
  end
end
