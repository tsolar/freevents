require "rails_helper"

RSpec.describe User, type: :model do
  describe "Relationships" do
    it { should have_many(:events).inverse_of(:owner) }
    it {
      should have_one(:person)
        .inverse_of(:user)
        .class_name("Entity::Person")
    }
  end

  describe "#to_s" do
    it "returns user email" do
      user = FactoryBot.create(:user)
      expect("#{user}").to eq user.email
    end
  end
end
