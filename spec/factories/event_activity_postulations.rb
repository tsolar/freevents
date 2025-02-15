FactoryBot.define do
  factory :event_activity_postulation, class: "Event::Activity::Postulation" do
    event { Event.last || FactoryBot.create(:event) }
    postulant_firstname { FFaker::NameMX.first_name }
    postulant_lastname { FFaker::NameMX.last_name }
    postulant_email { FFaker::Internet.email }
    postulant_phone_number { FFaker::PhoneNumber.phone_number }
    postulant_bio { FFaker::HipsterIpsum.paragraph[0..298] }
    activity_type { nil } # TBD: speech, workshop, etc.
    activity_title { FFaker::HipsterIpsum.sentence }
    activity_description { FFaker::HipsterIpsum.paragraphs }
    activity_estimated_duration { 120 } # minutes
    activity_difficulty_level { nil } # easy, medium, hard
    activity_preferred_time { "am" } # am, pm
  end
end
