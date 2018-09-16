require "rails_helper"

RSpec.describe TicketMailer, type: :mailer do
  describe "send_to_holder" do
    let(:ticket) { create(:ticket) }
    let(:mail) { TicketMailer.send_to_holder(ticket) }

    it "renders the headers" do
      expect(mail.subject).to eq("Send to holder")
      expect(mail.to).to eq([ticket.holder.participant.user.email])
    end

    it "renders the body" do
      # TODO: figure out how to escape `á` to `=C3=A1`
      # expect(mail.body.encoded).to match("Hi #{CGI.escapeHTML(ticket.holder.participant.full_name)}")
      ticket_link = ticket_url(ticket.token)
      ticket_pdf_link = ticket_url(ticket.token, format: :pdf)
      expect(mail.body.encoded).to match("#{ticket_link}")
    end

    it "is sent to the right user" do
      expect {
        perform_enqueued_jobs do
          ticket
        end
      }.to change { ActionMailer::Base.deliveries.size }.by(1)

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to[0]).to eq ticket.holder.participant.user.email
    end
  end
end
