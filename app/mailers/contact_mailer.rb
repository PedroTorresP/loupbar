class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  layout false

  def contact
    @sender = 'eddy@malou.com'
    @subject = 'alaide please'
    @content = 'Bonjour
    aidez moi svp
    pls'

    mail to: 'loupbar@email.com',from: @sender,  subject: @subject
  end
end
