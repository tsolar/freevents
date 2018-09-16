require 'rails_helper'

RSpec.describe Event::ActivityPolicy do

  let(:user) { create(:user) }
  let(:event_activity) { create(:event_activity) }

  subject { described_class.new(user, event_activity) }

  context "user is not logged in" do
    let(:user) { nil }

    it { is_expected.to permit_actions([:index, :show]) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context "user is logged in" do
    context "when user is not event owner" do
      it { is_expected.to permit_actions([:index, :show]) }
      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to forbid_new_and_create_actions }
      it { is_expected.to forbid_edit_and_update_actions }
    end

    context "when user is event owner" do
      let(:event_activity) {
        event = create(:event, owner: user)
        create(
          :event_activity,
          event_day: create(:event_day, event: event)
        )
      }
      it { is_expected.to permit_actions([:index, :show, :destroy]) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to permit_edit_and_update_actions }
    end

  end
end
