FactoryBot.define do
  factory :event_activity_participation, class: "Event::Activity::Participation" do
    event_activity { FactoryBot.create(:event_activity) }
    event_participation { FactoryBot.create(:event_participation) }
    # type "" # speaker, etc...

    factory :event_activity_speaker, class: "Event::Activity::Speaker" do
    end
  end
end
