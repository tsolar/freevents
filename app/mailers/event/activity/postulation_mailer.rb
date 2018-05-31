class Event::Activity::PostulationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event.activity.postulation_mailer.send_postulation_to_event_owner.subject
  #
  def send_postulation_to_event_owner(postulation)
    @greeting = "Hi"
    @postulation = postulation

    mail to: postulation.event.owner.email,
      subject: default_i18n_subject(event_title: @postulation.event.title)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event.activity.postulation_mailer.send_postulation_to_postulant.subject
  #
  def send_postulation_to_postulant(postulation)
    @greeting = "Hi"
    @postulation = postulation

    mail to: postulation.postulant_email,
      subject: default_i18n_subject(event_title: @postulation.event.title)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event.activity.postulation_mailer.send_approve_notification_to_postulant.subject
  #
  def send_approve_notification_to_postulant(postulation)
    @greeting = "Hi"
    @postulation = postulation

    mail to: postulation.postulant_email,
      subject: default_i18n_subject(event_title: @postulation.event.title)
  end
end
