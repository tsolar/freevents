require "rails_helper"

RSpec.describe Event::Day, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event }
    it { should validate_presence_of :starts_at }
    it { should validate_presence_of :ends_at }

    describe "timeliness" do
      context "starts_at is after ends_at" do
        it "should validate starts_at" do
          now = Time.current
          day = build(
            :event_day,
            starts_at: now,
            ends_at: now - 1.hour)
          expect(day.valid?).to be false
          expect(day.save).to be false
          expect(day.errors[:starts_at]).not_to be_empty
        end
      end

      context "starts_at is before ends_at" do
        it "should validate starts_at" do
          day = build(
            :event_day,
            starts_at: "14:00",
            ends_at: "15:00")
          expect(day.valid?).to be true
          expect(day.save).to be true
          expect(day.errors[:starts_at]).to be_empty
        end
      end

      context "starts_at is equal to ends_at" do
        it "should validate starts_at" do
          now = Time.current
          day = build(:event_day, starts_at: now, ends_at: now )
          expect(day.valid?).to be true
          expect(day.save).to be true
          expect(day.errors[:starts_at]).to be_empty
        end
      end
    end
  end

  describe "Relationships" do
    it { should belong_to(:event)
                 .inverse_of(:days) }
    it {
      should have_many(:activities)
              .class_name("Event::Activity")
              .with_foreign_key(:event_day_id)
    }
  end

  describe "Create" do
    it "should create a valid Event Day" do
      event_day = create(:event_day)
      expect(event_day.valid?).to be true
      expect(event_day.persisted?).to be true
    end
  end

  describe "#date" do
    it "should return starts_at as date" do
      event_day = create(:event_day)
      expect(event_day.date).to eq event_day.starts_at.to_date
    end
  end

  describe "#to_s" do
    context "when starts_at is present" do
      it "should return formatted start_date" do
        event_day = create(:event_day)
        expect("#{event_day}").to eq "#{I18n.l(event_day.starts_at, format: :event_day_with_time)} - #{I18n.l(event_day.ends_at, format: :only_time)}"
      end

      context "when ends_at next day" do
        it "should return formatted including start date and end date" do
          event_day = create(:event_day, starts_at: Time.current, ends_at: Time.current + 1.day - 1.minute)
          expect("#{event_day}").to eq "#{I18n.l(event_day.starts_at, format: :event_day_with_time)} - #{I18n.l(event_day.ends_at, format: :event_day_with_time)}"
        end

      end
    end

    context "when it is built but not saved yet" do
      context "when starts_at is nil" do
        it "returns TBD" do
          event_day = build(:event_day, starts_at: nil)
          expect("#{event_day}").to eq I18n.t("tbd")
        end
      end
    end
  end
end
