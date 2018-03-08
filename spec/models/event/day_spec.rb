require "rails_helper"

RSpec.describe Event::Day, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }

    describe "timeliness" do
      context "start_time is after end_time" do
        it "should validate start_time" do
          now = Time.current
          day = FactoryBot.build(:event_day, start_time: now + 1.hour, end_time: now)
          expect(day.valid?).to be false
          expect(day.save).to be false
          expect(day.errors[:start_time]).not_to be_empty
        end
      end

      context "start_time is before end_time" do
        it "should validate start_time" do
          now = Time.current
          day = FactoryBot.build(:event_day, start_time: now, end_time: now + 1.hour)
          expect(day.valid?).to be true
          expect(day.save).to be true
          expect(day.errors[:start_time]).to be_empty
        end
      end

      context "start_time is equal to end_time" do
        it "should validate start_time" do
          now = Time.current
          day = FactoryBot.build(:event_day, start_time: now, end_time: now )
          expect(day.valid?).to be true
          expect(day.save).to be true
          expect(day.errors[:start_time]).to be_empty
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
end
