# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
  subject(:event) { build(:event) }

  let(:today) { Date.today }

  describe "Validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_uniqueness_of :title }

    it { is_expected.to validate_presence_of :days }
    it {
      expect(event).to accept_nested_attributes_for(:days)
        .allow_destroy(true)
    }
    it {
      expect(event).to accept_nested_attributes_for(:venues)
        .allow_destroy(true)
    }
  end

  describe "Relationships" do
    it {
      expect(event).to have_many(:days)
        .inverse_of(:event)
        .dependent(:destroy)
    }
    it {
      expect(event).to have_many(:participations)
        .dependent(:destroy)
    }
    it {
      expect(event).to have_many(:activities)
        .class_name("Event::Activity")
        .through(:days)
        .dependent(:destroy)
    }
    it {
      expect(event).to have_many(:activity_postulations)
        .class_name("Event::Activity::Postulation")
        .dependent(:destroy)
    }
    it {
      expect(event).to have_many(:event_venues)
        .class_name("Event::Venue")
        .dependent(:destroy)
    }
    it {
      expect(event).to have_many(:venues)
        .class_name("::Venue")
        .through(:event_venues)
    }

    it {
      expect(event).to belong_to(:owner)
        .inverse_of(:events)
        .class_name("User")
        .with_foreign_key(:owner_id)
    }
  end

  describe "to_s" do
    it "returns title" do
      event_title = FFaker::Lorem.sentence
      event = create(:event, title: event_title)
      expect(event.to_s).to eq event_title
    end
  end

  describe "Create" do
    it "creates a valid Event" do
      event = create(:event)
      expect(event.valid?).to be true
      expect(event.persisted?).to be true
      expect(event.days.count).to be 1
    end
  end

  describe "#days" do
    let(:event) do
      create(
        :event,
        days_attributes: days_attributes
      )
    end

    let(:days_attributes) do
      [
        FactoryBot.attributes_for(:event_day, starts_at: "#{today} 15:00", ends_at: "#{today} 18:00"),
        FactoryBot.attributes_for(:event_day, starts_at: "#{today + 1.day} 15:00", ends_at: "#{today + 1.day} 18:00")
      ]
    end

    context "when first day is created BEFORE last day" do
      it "returns days ordered by date, not by created_at or id" do
        days = event.days
        expect(days.first.date < days.last.date).to be true
      end
    end

    context "when first day is created AFTER last day" do
      let(:days_attributes) do
        [
          FactoryBot.attributes_for(:event_day, starts_at: "#{today + 1.day} 15:00", ends_at: "#{today + 1.day} 18:00")
        ]
      end

      before do
        event.days.create(
          FactoryBot.attributes_for(
            :event_day,
            starts_at: "#{today} 15:00",
            ends_at: "#{today} 18:00"
          )
        )
        event.reload
      end

      it "returns days ordered by starts_at, not by created_at or id" do
        days = event.days
        expect(days.first.date < days.last.date).to be true
      end
    end
  end

  describe "#dates" do
    let(:event) { create(:event, days_attributes: [FactoryBot.attributes_for(:event_day)]) }

    context "when event has only one day" do
      before do
        expect(event.days.count).to eq 1
      end

      it "returns the dates of that day" do
        expect(event.dates).to eq "#{event.days.first.date} #{event.days.first.starts_at.strftime('%H:%M')}"
      end
    end

    context "when event has more than one day" do
      let(:event) do
        create(
          :event,
          days_attributes:
          [
            FactoryBot.attributes_for(:event_day, starts_at: "#{today} 15:00", ends_at: "#{today} 18:00"),
            FactoryBot.attributes_for(:event_day, starts_at: "#{today} 15:00", ends_at: "#{today} 18:00")
          ]
        )
      end

      before do
        expect(event.days.count).to eq 2
      end

      it "returns the date of the first day, and the date of the last day" do
        expect(event.dates).to eq "#{event.days.first.starts_at.to_date} #{event.days.first.starts_at.strftime('%H:%M')} - #{event.days.last.ends_at.to_date} #{event.days.last.ends_at.strftime('%H:%M')}"
      end
    end
  end
end
