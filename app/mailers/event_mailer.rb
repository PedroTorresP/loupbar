class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.event_inscription.subject
  #
  def event_inscription
    @participant = params[:participant]

    mail to: @participant.user.email, reply_to: 'renaudrey1989@outlook.fr', subject: "Inscription à l'évènement : "+@participant.event.name.to_s
  end
end
