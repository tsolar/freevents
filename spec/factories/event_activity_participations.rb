FactoryBot.define do
  factory :event_activity_participation, class: 'Event::Activity::Participation' do
    event_activity nil
    event_participation nil
    type ""
  end
end
