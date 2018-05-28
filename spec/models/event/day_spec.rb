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
          day = FactoryBot.build(
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
          day = FactoryBot.build(
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
          day = FactoryBot.build(:event_day, starts_at: now, ends_at: now )
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
      event_day = FactoryBot.create(:event_day)
      expect(event_day.valid?).to be true
      expect(event_day.persisted?).to be true
    end
  end

  describe "#date" do
    it "should return starts_at as date" do
      event_day = FactoryBot.create(:event_day)
      expect(event_day.date).to eq event_day.starts_at.to_date
    end
  end

  describe "#to_s" do
    it "should return #date" do
      event_day = FactoryBot.create(:event_day)
      expect("#{event_day}").to eq event_day.date.to_s
    end
  end
end
