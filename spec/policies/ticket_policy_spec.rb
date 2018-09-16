require 'rails_helper'

RSpec.describe TicketPolicy do
  let(:user) { create(:user) }
  let(:user_person) {
    create(:entity_person, user: user)
  }
  let(:holder) {
    create(
      :event_attendee,
      participant: user_person
    )
  }
  let(:ticket) { create(:ticket, holder: holder) }

  subject { described_class.new(user, ticket) }

  context "user is not logged in" do
    let(:user) { nil }
    let(:ticket) { create(:ticket) }

    it { is_expected.to forbid_actions([:show, :print, :scan]) }
  end

  context "user is logged in" do
    context "user is the ticket holder" do
      it { is_expected.to permit_actions([:show, :print]) }
      it { is_expected.to forbid_action(:scan) }
    end

    context "user is not the ticket holder" do
      let(:other_user) { create(:user) }
      let(:user_person) {
        create(:entity_person, user: other_user)
      }

      it { is_expected.to forbid_actions([:show, :print, :scan]) }
    end
  end
end
