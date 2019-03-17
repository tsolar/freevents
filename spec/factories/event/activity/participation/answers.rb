FactoryBot.define do
  factory :event_activity_participation_answer, class: 'Event::Activity::Participation::Answer' do
    event_activity_participation { nil }
    will_attend { "MyString" }
    did_attend { false }
  end
end
