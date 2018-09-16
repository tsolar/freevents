require 'rails_helper'

RSpec.describe Event::Activity::PostulationPolicy do

  let(:user) { create(:user) }
  let(:event_activity_postulation) { create(:event_activity_postulation) }

  subject { described_class.new(user, event_activity_postulation) }

  context "user is not logged in" do
    let(:user) { nil }

    it { is_expected.to forbid_actions([:index, :show, :destroy, :approve]) }
    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context "user is logged in" do
    context "when user is not event owner" do
      it { is_expected.to forbid_actions([:index, :show, :destroy, :approve]) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to forbid_edit_and_update_actions }
    end

    context "when user is event owner" do
      let(:event_activity_postulation) {
        event = create(:event, owner: user)
        create(:event_activity_postulation, event: event)
      }
      it { is_expected.to forbid_action(:index) }
      it { is_expected.to permit_actions([:show, :destroy, :approve]) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to forbid_edit_and_update_actions }
    end

  end
end
