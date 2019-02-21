# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "Relationships" do
    it { is_expected.to have_many(:events).inverse_of(:owner) }
    it {
      expect(subject).to have_one(:person)
        .inverse_of(:user)
        .class_name("Entity::Person")
    }
  end

  it {
    expect(subject).to delegate_method(:firstname)
      .to(:person)
      .with_prefix(true)
    # .allow_nil(true)
  }

  it {
    expect(subject).to delegate_method(:lastname)
      .to(:person)
      .with_prefix(true)
    # .allow_nil(true)
  }

  describe "#to_s" do
    it "returns user email" do
      user = create(:user)
      expect(user.to_s).to eq user.email
    end
  end

  describe "#name" do
    let(:user) { create(:user) }
    let(:person) { create(:entity_person, user: user) }

    context "when person.firstname and lastname are present" do
      before do
        expect(person.firstname).to be_present
        expect(person.lastname).to be_present
      end

      it "returns person firstname and lastname" do
        expect(user.name).to eq "#{person.firstname} #{person.lastname}"
      end
    end

    context "when only person firstname is present" do
      let(:person) do
        create(:entity_person, user: user, lastname: nil)
      end

      before do
        expect(person.firstname).to be_present
        expect(person.lastname).to be_nil
      end

      it "returns person firstname" do
        expect(user.name).to eq person.firstname.to_s
      end
    end

    context "when person is not present" do
      let(:person) { nil }

      before do
        expect(user.person).to be_nil
      end

      it "returns user email" do
        expect(user.name).to eq user.email.to_s
      end
    end
  end
end
