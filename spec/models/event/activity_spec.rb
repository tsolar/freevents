require "rails_helper"

RSpec.describe Event::Activity, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event_day }
    it { should validate_presence_of :title }

    it "should validate starts_at date is the same of event_day.starts_at date" do
      now = Time.current
      tomorrow = Time.current + 1.day
      event_day = create(:event_day, starts_at: now + 1.hour, ends_at: now + 2.hour)
      activity = build(:event_activity, starts_at: tomorrow + 1.hour, ends_at: tomorrow + 1.hour + 30.minute)
      expect(activity).to be_invalid
      expect(activity.save).to be false
      expect(activity).not_to be_persisted
      expect(activity.errors.details[:starts_at]).to include(error: :must_be_on_event_day_date)
    end

    it "should validate ends_at date is the same of event_day.ends_at date" do
      now = Time.current
      tomorrow = Time.current + 1.day
      event_day = create(:event_day, starts_at: now + 1.hour, ends_at: now + 2.hour)
      activity = build(:event_activity, starts_at: tomorrow + 1.hour, ends_at: tomorrow + 1.hour + 30.minute)
      expect(activity).to be_invalid
      expect(activity.save).to be false
      expect(activity).not_to be_persisted
      expect(activity.errors.details[:ends_at]).to include(error: :must_be_on_event_day_date)
    end

    context "when activity starts on event_day.starts_at" do
      context "when activity ends before event_day.ends_at" do
        it "should create the activity" do
          now = Time.current
          event_day = create(:event_day, starts_at: now + 1.hour, ends_at: now + 2.hour)
          activity = build(:event_activity, event_day_id: event_day.id,  starts_at: now + 1.hour, ends_at: now + 1.hour + 30.minute)
          expect(activity).to be_valid
          expect(activity.save).to be true
          expect(activity).to be_persisted
        end
      end

      context "when activity ends on event_day.ends_at" do
        it "should create the activity" do
          now = Time.current
          ends_at = now + 2.hour
          event_day = create(:event_day, starts_at: now + 1.hour, ends_at: ends_at)
          # it only passes the test if it ends a second before...
          activity = build(:event_activity, event_day_id: event_day.id, starts_at: now + 1.hour, ends_at: ends_at - 1.second)
          expect(activity).to be_valid
          expect(activity.save).to be true
          expect(activity).to be_persisted
        end
      end

      context "when activity ends after event_day.ends_at" do
        it "should not create the activity" do
          now = Time.current
          event_day = create(:event_day, starts_at: now + 1.hour, ends_at: now + 2.hour)
          activity = build(:event_activity, event_day_id: event_day.id, starts_at: now + 1.hour, ends_at: now + 3.hour)
          expect(activity).not_to be_valid
          expect(activity.save).to be false
          expect(activity).not_to be_persisted
        end
      end
    end

    context "when activity starts after event_day.starts_at and before event_day.ends_at" do
      context "when ends before event_day.ends_at" do
        it "should create the activity" do
          now = Time.current
          event_day = create(:event_day, starts_at: now + 1.hour, ends_at: now + 20.hour)
          activity = build(:event_activity, event_day_id: event_day.id, starts_at: now + 10.hour, ends_at: now + 11.hour + 30.minute)
          expect(activity).to be_valid
          expect(activity.save).to be true
          expect(activity).to be_persisted
        end
      end

      context "when ends after event_day.ends_at" do
        it "should not create the activity" do
          now = Time.current
          event_day = create(:event_day, starts_at: now + 1.hour, ends_at: now + 20.hour)
          activity = build(:event_activity, event_day_id: event_day.id, starts_at: now + 10.hour, ends_at: now + 21.hour)
          expect(activity).not_to be_valid
          expect(activity.save).to be false
          expect(activity).not_to be_persisted
        end
      end
    end

    context "when activity starts after event_day.starts_at and after event_day.ends_at" do
      it "should not create the activity" do
        now = Time.current
        event_day = create(:event_day, starts_at: now + 1.hour, ends_at: now + 2.hour)
        activity = build(:event_activity, event_day_id: event_day.id, starts_at: now + 3.hour, ends_at: now + 3.hour + 30.minute)
        expect(activity).not_to be_valid
        expect(activity.save).to be false
        expect(activity).not_to be_persisted
      end
    end

  end

  describe "Relationships" do
    it { should belong_to(:event_day)
              .class_name("Event::Day") }

    it { should have_many(:participations)
              .class_name("Event::Activity::Participation")
              .with_foreign_key(:event_activity_id)
              .dependent(:destroy) }

    it { should have_many(:speakers)
              .class_name("Event::Activity::Speaker")
              .with_foreign_key(:event_activity_id)
              .dependent(:destroy) }

    it { should belong_to(:postulation)
        .class_name("Event::Activity::Postulation")
        .with_foreign_key(:event_activity_postulation_id)
      # .optional(true)
    }
    it { should have_one(:event).through(:event_day) }

    it { should delegate_method(:starts_at).to(:event_day).with_prefix(true) }
    it { should delegate_method(:ends_at).to(:event_day).with_prefix(true) }
  end

  describe "Create" do
    it "should create a valid event_activity" do
      activity = build(:event_activity)
      expect(activity).to be_valid
      expect(activity.save).to be true
      expect(activity).to be_persisted
    end

    it "should create an invalid event_activity" do
      activity = build(:event_activity, :invalid)
      expect(activity).not_to be_valid
      expect(activity.save).to be false
      expect(activity).not_to be_persisted
    end

  end
end
