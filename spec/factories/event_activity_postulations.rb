FactoryBot.define do
  factory :event_activity_postulation, class: 'Event::Activity::Postulation' do
    event nil
    postulant_firstname "MyString"
    postulant_lastname "MyString"
    postulant_email "MyString"
    postulant_phone_number "MyString"
    postulant_bio "MyText"
    activity_type "MyString"
    activity_title "MyString"
    activity_description "MyText"
    activity_estimated_duration 1
    activity_difficulty_level "MyString"
    activity_preferred_time "MyString"
  end
end
