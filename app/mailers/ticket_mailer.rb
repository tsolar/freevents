class TicketMailer < ApplicationMailer
  add_template_helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.send_to_holder.subject
  #
  def send_to_holder(ticket)
    @ticket = ticket
    @greeting = "Hi #{ticket.holder.participant.full_name}"
    mail to: ticket.holder.participant.user.email
  end
end
