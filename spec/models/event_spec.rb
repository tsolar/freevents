require "rails_helper"

RSpec.describe Event, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }

    it { should validate_presence_of :days }
    it { should accept_nested_attributes_for(:days)
                 .allow_destroy(true) }

  end

  describe "Relationships" do
    it { should have_many(:days)
                 .inverse_of(:event)
                 .dependent(:destroy) }
    it { should have_many(:participations)
                 .dependent(:destroy) }
    it { should have_many(:activities)
                 .class_name("Event::Activity")
                 .through(:days)
                 .dependent(:destroy) }
    it { should have_many(:event_venues)
                 .class_name("Event::Venue")
                 .dependent(:destroy) }
    it { should have_many(:venues)
                 .class_name("::Venue")
                 .through(:event_venues) }

    it {
      should belong_to(:owner)
        .inverse_of(:events)
        .class_name("User")
        .with_foreign_key(:owner_id)
    }
  end

  describe "to_s" do
    it "returns title" do
      event_title = FFaker::Lorem.sentence
      event = create(:event, title: event_title)
      expect("#{event}").to eq event_title
    end
  end

  describe "Create" do
    it "should create a valid Event" do
      event = create(:event)
      expect(event.valid?).to be true
      expect(event.persisted?).to be true
      expect(event.days.count).to be 1
    end
  end

  let(:today) { Date.today }

  describe "#days" do
    let(:event) {
      create(
        :event,
        days_attributes: days_attributes
      )
    }

    let(:days_attributes) {
      [
        FactoryBot.attributes_for(:event_day, starts_at: "#{today} 15:00", ends_at: "#{today} 18:00"),
        FactoryBot.attributes_for(:event_day, starts_at: "#{today + 1.day} 15:00", ends_at: "#{today + 1.day} 18:00")
      ]
    }

    context "when first day is created BEFORE last day" do
      it "should return days ordered by date, not by created_at or id" do
        days = event.days
        expect(days.first.date < days.last.date).to be true
      end
    end

    context "when first day is created AFTER last day" do
      let(:days_attributes) {
        [
          FactoryBot.attributes_for(:event_day, starts_at: "#{today + 1.day} 15:00", ends_at: "#{today + 1.day} 18:00")
        ]
      }

      before :each do
        event.days.create(
          FactoryBot.attributes_for(
            :event_day,
            starts_at: "#{today} 15:00",
            ends_at: "#{today} 18:00"
          )
        )
        event.reload
      end

      it "should return days ordered by starts_at, not by created_at or id" do
        days = event.days
        expect(days.first.date < days.last.date).to be true
      end
    end
  end

  describe "#dates" do
    let(:event) { create(:event, days_attributes: [FactoryBot.attributes_for(:event_day)]) }

    context "when event has only one day" do
      before :each do
        expect(event.days.count).to eq 1
      end

      it "should return the dates of that day" do
        expect(event.dates).to eq "#{event.days.first.date} #{event.days.first.starts_at.strftime('%H:%M')}"
      end
    end

    context "when event has more than one day" do
      let(:event) {
        create(
          :event,
          days_attributes:
          [
            FactoryBot.attributes_for(:event_day, starts_at: "#{today} 15:00", ends_at: "#{today} 18:00"),
            FactoryBot.attributes_for(:event_day, starts_at: "#{today} 15:00", ends_at: "#{today} 18:00")
          ]
        )
      }

      before :each do
        expect(event.days.count).to eq 2
      end

      it "should return the date of the first day, and the date of the last day" do
        expect(event.dates).to eq "#{event.days.first.starts_at.to_date} #{event.days.first.starts_at.strftime('%H:%M')} - #{event.days.last.ends_at.to_date} #{event.days.last.ends_at.strftime('%H:%M')}"
      end
    end
  end
end
