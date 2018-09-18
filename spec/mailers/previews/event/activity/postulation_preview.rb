# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/event/activity/postulation
class Event::Activity::PostulationPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/event/activity/postulation/send_postulation_to_event_owner
  def send_postulation_to_event_owner
    postulation = Event::Activity::Postulation.last || Event::Activity::Postulation.create!(FactoryBot.attributes_for(:event_activity_postulation))
    Event::Activity::PostulationMailer.send_postulation_to_event_owner(postulation)
  end

  # Preview this email at http://localhost:3000/rails/mailers/event/activity/postulation/send_postulation_to_postulant
  def send_postulation_to_postulant
    postulation = Event::Activity::Postulation.last || Event::Activity::Postulation.create!(FactoryBot.attributes_for(:event_activity_postulation))
    Event::Activity::PostulationMailer.send_postulation_to_postulant(postulation)
  end

  # Preview this email at http://localhost:3000/rails/mailers/event/activity/postulation/send_approve_notification_to_postulant
  def send_approve_notification_to_postulant
    postulation = Event::Activity::Postulation.create!(FactoryBot.attributes_for(:event_activity_postulation))
    postulation.approve
    Event::Activity::PostulationMailer.send_approve_notification_to_postulant(postulation)
  end
end
