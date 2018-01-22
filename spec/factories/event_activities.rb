FactoryBot.define do
  factory :event_activity, class: 'Event::Activity' do
    type ""
    event_day nil
    title "MyString"
    description "MyText"
    starts_at "2018-01-22 00:20:49"
    ends_at "2018-01-22 00:20:49"
  end
end
