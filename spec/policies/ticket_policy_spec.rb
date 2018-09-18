# frozen_string_literal: true

require "rails_helper"

RSpec.describe TicketPolicy do
  subject { described_class.new(user, ticket) }

  let(:user) { create(:user) }
  let(:user_person) do
    create(:entity_person, user: user)
  end
  let(:holder) do
    create(
      :event_attendee,
      participant: user_person
    )
  end
  let(:ticket) { create(:ticket, holder: holder) }

  context "user is not logged in" do
    let(:user) { nil }
    let(:ticket) { create(:ticket) }

    it { is_expected.to forbid_actions(%i[show print scan]) }
  end

  context "user is logged in" do
    context "user is the ticket holder" do
      it { is_expected.to permit_actions(%i[show print]) }
      it { is_expected.to forbid_action(:scan) }
    end

    context "user is not the ticket holder" do
      let(:other_user) { create(:user) }
      let(:user_person) do
        create(:entity_person, user: other_user)
      end

      it { is_expected.to forbid_actions(%i[show print scan]) }
    end
  end
end
