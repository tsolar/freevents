FactoryBot.define do
  factory :event_activity_postulation, class: "Event::Activity::Postulation" do
    event_id { Event.last.try(:id) || FactoryBot.create(:event).id }
    postulant_firstname { FFaker::NameMX.first_name }
    postulant_lastname { FFaker::NameMX.last_name }
    postulant_email { FFaker::Internet.email }
    postulant_phone_number { FFaker::PhoneNumber.phone_number }
    postulant_bio { FFaker::HipsterIpsum.paragraph[0..298] }
    activity_type { ["speech", "workshop"].sample }
    activity_title { FFaker::HipsterIpsum.sentence }
    activity_description { FFaker::HipsterIpsum.paragraphs.join(" ") }
    activity_estimated_duration 120 # minutes
    activity_difficulty_level { ["easy", "medium", "hard", "expert"].sample }
    activity_preferred_time "am" # am, pm

    trait :invalid do
      event nil
      postulant_firstname nil
    end
  end
end
