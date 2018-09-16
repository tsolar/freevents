require "rails_helper"

RSpec.describe Event::Activity::PostulationMailer, type: :mailer do
  let(:postulation) { create(:event_activity_postulation) }

  describe "send_postulation_to_event_owner" do
    let(:mail) { Event::Activity::PostulationMailer.send_postulation_to_event_owner(postulation) }

    it "renders the headers" do
      expect(mail.subject).to eq(I18n.t("event.activity.postulation_mailer.send_postulation_to_event_owner.subject", event_title: postulation.event.title))
      expect(mail.to).to eq([postulation.event.owner.email])
      # expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "send_postulation_to_postulant" do
    let(:mail) { Event::Activity::PostulationMailer.send_postulation_to_postulant(postulation) }

    it "renders the headers" do
      expect(mail.subject).to eq(I18n.t("event.activity.postulation_mailer.send_postulation_to_postulant.subject", event_title: postulation.event.title))
      expect(mail.to).to eq([postulation.postulant_email])
      # expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "send_approve_notification_to_postulant" do
    let(:mail) { Event::Activity::PostulationMailer.send_approve_notification_to_postulant(postulation) }

    it "renders the headers" do
      message_delivery = instance_double(ActionMailer::MessageDelivery)
      expect(Event::Activity::PostulationMailer).to receive(:send_approve_notification_to_postulant).with(postulation).and_return(message_delivery)
      allow(message_delivery).to receive(:deliver_later)
      postulation.approve
      expect(Event::Activity::PostulationMailer).to receive(:send_approve_notification_to_postulant).with(postulation).and_call_original
      postulation.reload
      expect(mail.subject).to eq(I18n.t("event.activity.postulation_mailer.send_approve_notification_to_postulant.subject", event_title: postulation.event.title))
      expect(mail.to).to eq([postulation.postulant_email])
      # expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      message_delivery = instance_double(ActionMailer::MessageDelivery)
      expect(Event::Activity::PostulationMailer).to receive(:send_approve_notification_to_postulant).with(postulation).and_return(message_delivery)
      allow(message_delivery).to receive(:deliver_later)
      postulation.approve
      expect(Event::Activity::PostulationMailer).to receive(:send_approve_notification_to_postulant).with(postulation).and_call_original
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
