# frozen_string_literal: true

require "rails_helper"

RSpec.describe TicketMailer, type: :mailer do
  describe "send_to_holder" do
    let(:ticket) { create(:ticket) }
    let(:mail) { TicketMailer.send_to_holder(ticket) }
    let(:participant_full_name) do
      ticket.holder.participant.full_name
    end

    it "renders the headers" do
      expect(mail.subject).to eq(
        I18n.t(
          "ticket_mailer.send_to_holder.subject",
          activity_title: ticket.holder.activity.title
        )
      )
      expect(mail.to).to eq([ticket.holder.participant.user.email])
    end

    it "renders the body" do
      expect(mail.html_part.body.encoded).to match("Hi #{participant_full_name}")
      ticket_link = ticket_url(ticket.token)
      ticket_pdf_link = ticket_url(ticket.token, format: :pdf)
      expect(mail.body.encoded).to match(ticket_link.to_s)
      expect(mail.body.encoded).to match(ticket_pdf_link.to_s)
    end

    it "is sent to the right user" do
      expect do
        perform_enqueued_jobs { ticket }
      end.to change { ActionMailer::Base.deliveries.size }.by(1)

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to[0]).to eq ticket.holder.participant.user.email
    end
  end
end
