require "rails_helper"

RSpec.describe EventPolicy do

  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, owner: user) }

  subject { described_class.new(user, event) }

  context "user is not logged in" do
    let(:user) { nil }
    let(:event) { FactoryBot.create(:event) }

    it { is_expected.to permit_actions([:index, :show]) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:respond_attendance) }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context "user is logged in" do
    context "user is the event owner" do
      it { is_expected.to permit_actions([:index, :show]) }
      it { is_expected.to permit_action(:destroy) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to permit_edit_and_update_actions }
      it { is_expected.to forbid_action(:respond_attendance) }
    end

    context "user is not the event owner" do
      let(:other_person) { FactoryBot.create(:entity_person) }
      let(:other_user) { other_person.user }
      let(:event) {
        FactoryBot.create(:event, owner: other_user)
      }
      let(:person) { FactoryBot.create(:entity_person) }
      let(:user) { person.user }

      it { is_expected.to permit_actions([:index, :show, :respond_attendance]) }
      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to permit_new_and_create_actions }
      it { is_expected.to forbid_edit_and_update_actions }
    end
  end
end
