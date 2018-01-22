FactoryBot.define do
  factory :event_day, class: 'Event::Day' do
    event nil
    date "2018-01-21"
    start_time "2018-01-21 22:39:40"
    end_time "2018-01-21 22:39:40"
  end
end
