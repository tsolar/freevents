FactoryBot.define do
  factory :entity_person, class: 'Entity::Person' do
    firstname "MyString"
    lastname "MyString"
    dob "2018-01-22"
    bio "MyText"
  end
end
