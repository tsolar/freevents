require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "relationships" do
    it { should belong_to(:holder) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:token) }
  end

  describe "Create" do
    it "should create a valid Ticket and send email to holder" do
      ticket = FactoryBot.build(:ticket)
      expect(ticket).to be_valid
      expect {
        expect(ticket.save).to be true
        expect(ticket.token).not_to be nil
        expect(ticket.scanned).to be nil
        expect(ticket.scanned_at).to be nil
      }.to have_enqueued_job.on_queue("freevents-#{Rails.env}.mailers")
    end

    it "should not create an invalid Ticket" do
      ticket = FactoryBot.build(:ticket, :invalid)
      expect(ticket).not_to be_valid
      expect(ticket.save).to be false
      expect(ticket.token).to be nil
      expect(ticket.scanned).to be nil
      expect(ticket.scanned_at).to be nil
    end

    it "should not create a ticket if using a existing token" do
      token = SecureRandom.base58(24)
      ticket1 = FactoryBot.create(:ticket, token: token)
      expect(ticket1).to be_persisted
      ticket1.reload
      expect(ticket1.token).to eq token
      expect(ticket1.scanned).to be nil
      expect(ticket1.scanned_at).to be nil

      ticket2 = FactoryBot.build(:ticket, token: token)
      expect(ticket2.save).to be false
      expect(ticket2.errors[:token]).to be_present
      expect(ticket2.token).to eq token
      expect(ticket2.scanned).to be nil
      expect(ticket2.scanned_at).to be nil

      # if set ticket2.token to nil, it should be able to be saved
      ticket2.token = nil
      expect(ticket2.save).to be true
      expect(ticket2.errors[:token]).to be_empty
      expect(ticket2.token).not_to eq token
      expect(ticket2.scanned).to be nil
      expect(ticket2.scanned_at).to be nil
    end
  end

  describe "update" do
    it "should not send any email" do
      ticket = FactoryBot.create(:ticket)

      expect {
        expect(ticket.update(scanned: true, scanned_at: Time.now)).to be true
      }.not_to have_enqueued_job.on_queue("freevents-#{Rails.env}.mailers")
    end
  end
end
