FactoryBot.define do
  factory :event_participation, class: 'Event::Participation' do
    event nil
    type ""
    participant nil
    description "MyText"
  end
end
