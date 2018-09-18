# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "relationships" do
    it { is_expected.to belong_to(:holder) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:token) }
  end

  describe "Create" do
    it "creates a valid Ticket and send email to holder" do
      ticket = build(:ticket)
      expect(ticket).to be_valid
      expect do
        expect(ticket.save).to be true
        expect(ticket.token).not_to be nil
        expect(ticket.scanned).to be nil
        expect(ticket.scanned_at).to be nil
      end.to have_enqueued_job.on_queue("freevents-#{Rails.env}.mailers")
    end

    it "does not create an invalid Ticket" do
      ticket = build(:ticket, :invalid)
      expect(ticket).not_to be_valid
      expect(ticket.save).to be false
      expect(ticket.token).to be nil
      expect(ticket.scanned).to be nil
      expect(ticket.scanned_at).to be nil
    end

    it "does not create a ticket if using a existing token" do
      token = SecureRandom.base58(24)
      ticket1 = create(:ticket, token: token)
      expect(ticket1).to be_persisted
      ticket1.reload
      expect(ticket1.token).to eq token
      expect(ticket1.scanned).to be nil
      expect(ticket1.scanned_at).to be nil

      ticket2 = build(:ticket, token: token)
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
    it "does not send any email" do
      ticket = create(:ticket)

      expect do
        expect(ticket.update(scanned: true, scanned_at: Time.now)).to be true
      end.not_to have_enqueued_job.on_queue("freevents-#{Rails.env}.mailers")
    end
  end

  describe "#scan" do
    let(:ticket) { create(:ticket) }

    context "when ticket is already scanned" do
      before do
        expect(ticket.scan).to be true
        expect(ticket.scanned).to be true
        expect(ticket.scanned?).to be true
        expect(ticket.scanned_at).to be_present
      end

      it "returns false" do
        expect(ticket.scan).to be false
        expect(ticket.errors).to be_any
        expect(ticket.errors[:scanned]).to include I18n.t("activerecord.errors.models.ticket.attributes.scanned.already_scanned") # "Ticket was already scanned"
      end
    end

    context "when ticket is not scanned" do
      before do
        expect(ticket.scanned).to be_nil
        expect(ticket.scanned?).to be false
        expect(ticket.scanned_at).to be_nil
      end

      it "returns true and set scanned to true and scanned_at to current time" do
        expect(ticket.scan).to be true
        expect(ticket.errors).to be_empty
        expect(ticket.scanned?).to be true
        expect(ticket.scanned_at).to be_present
      end
    end
  end
end
