# frozen_string_literal: true

class TicketMailer < ApplicationMailer
  add_template_helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.send_to_holder.subject
  #
  def send_to_holder(ticket)
    @ticket = ticket
    @activity = ticket.holder.activity
    @greeting = "Hi #{ticket.holder.participant.full_name}"
    mail to: ticket.holder.participant.user.email,
         subject: default_i18n_subject(
           activity_title: @activity.title
         )

  end
end
