# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Day, type: :model do
  subject(:day) { build(:event_day) }

  describe "Validations" do
    it { is_expected.to validate_presence_of :event }
    it { is_expected.to validate_presence_of :starts_at }
    it { is_expected.to validate_presence_of :ends_at }

    describe "timeliness" do
      let(:now) { Time.current }
      let(:day) do
        build(
          :event_day,
          starts_at: starts_at,
          ends_at: ends_at
        )
      end

      context "when starts_at is after ends_at" do
        let(:starts_at) { now }
        let(:ends_at) { now - 1.hour }

        it "validates starts_at" do
          expect(day.valid?).to be false
          expect(day.save).to be false
          expect(day.errors[:starts_at]).not_to be_empty
        end
      end

      context "when starts_at is before ends_at" do
        let(:starts_at) { "14:00" }
        let(:ends_at) { "15:00" }

        it "validates starts_at" do
          expect(day.valid?).to be true
          expect(day.save).to be true
          expect(day.errors[:starts_at]).to be_empty
        end
      end

      context "when starts_at is equal to ends_at" do
        let(:starts_at) { now }
        let(:ends_at) { now }

        it "validates starts_at" do
          expect(day.valid?).to be true
          expect(day.save).to be true
          expect(day.errors[:starts_at]).to be_empty
        end
      end
    end
  end

  describe "Relationships" do
    it {
      expect(day).to belong_to(:event)
        .inverse_of(:days)
    }
    it {
      expect(day).to have_many(:activities)
        .class_name("Event::Activity")
        .with_foreign_key(:event_day_id)
        .dependent(:destroy)
    }
  end

  describe "Create" do
    it "creates a valid Event Day" do
      event_day = create(:event_day)
      expect(event_day.valid?).to be true
      expect(event_day.persisted?).to be true
    end
  end

  describe "#date" do
    it "returns starts_at as date" do
      event_day = create(:event_day)
      expect(event_day.date).to eq event_day.starts_at.to_date
    end
  end

  describe "#to_s" do
    let(:event_day) { create(:event_day) }

    context "when starts_at is present" do
      it "returns formatted start_date" do
        starts_at_date = I18n.l(
          event_day.starts_at, format: :event_day_with_time
        )
        ends_at_date = I18n.l(event_day.ends_at, format: :only_time)
        expect(event_day.to_s).to eq "#{starts_at_date} - #{ends_at_date}"
      end

      context "when ends_at next day" do
        let(:event_day) do
          create(
            :event_day,
            starts_at: Time.current,
            ends_at: Time.current + 1.day - 1.minute
          )
        end

        it "returns formatted including start date and end date" do
          starts_at_date = I18n.l(
            event_day.starts_at, format: :event_day_with_time
          )
          ends_at_date = I18n.l(event_day.ends_at, format: :event_day_with_time)
          expect(event_day.to_s).to eq "#{starts_at_date} - #{ends_at_date}"
        end
      end
    end

    context "when it is built but not saved yet" do
      context "when starts_at is nil" do
        it "returns TBD" do
          event_day = build(:event_day, starts_at: nil)
          expect(event_day.to_s).to eq I18n.t("tbd")
        end
      end
    end
  end
end
