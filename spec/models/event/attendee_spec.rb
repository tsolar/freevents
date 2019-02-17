# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Attendee, type: :model do
  subject(:attendee) { create(:event_attendee) }

  describe "Validations" do
    it { is_expected.to validate_presence_of :event }
  end

  describe "Relationships" do
    it { is_expected.to belong_to :event }
    it { is_expected.to belong_to :participant }
    it {
      expect(attendee).to have_one(:answer)
        .class_name("Event::Participation::Answer")
        .with_foreign_key(:event_participation_id)
        .inverse_of(:attendee)
        .dependent(:destroy)
    }
    it { is_expected.to have_one(:ticket).dependent(:destroy) }
  end

  describe "Create" do
    it "creates a valid Event::Attendee and an Event::Participation::Confirmation" do
      expect do
        attendee = create(:event_attendee)
        expect(attendee.valid?).to be true
        expect(attendee).to be_persisted
        expect(attendee.answer).to be_a Event::Participation::Answer
        expect(attendee.answer).to be_persisted
      end.to change(Event::Participation, :count)
        .by(1)
        .and change(Event::Participation::Answer, :count).by(1)
    end

    context "when attributes are invalid" do
      it "does not create the Event::Attendee nor an Event::Participation::Confirmation" do
        attendee_invalid = build(:event_attendee, :invalid)
        expect(attendee_invalid.valid?).to be false
        expect(attendee_invalid.save).to be false
        expect(attendee_invalid.persisted?).to be false
        expect(attendee_invalid.answer).to be nil
      end
    end
  end
end
