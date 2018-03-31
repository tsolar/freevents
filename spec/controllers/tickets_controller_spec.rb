require "rails_helper"

RSpec.describe TicketsController, type: :controller do
  let(:valid_session) { {} }

  let(:user_person) {
    FactoryBot.create(:entity_person, user: FactoryBot.create(:user))
  }
  let(:holder) {
    FactoryBot.create(
      :event_attendee,
      participant: user_person
    )
  }
  let(:ticket) { FactoryBot.create(:ticket, holder: holder) }

  describe "GET #show" do
    context "when user is logged in" do
      login_user
      context "when user is ticket holder" do
        let(:user_person) { FactoryBot.create(:entity_person, user: @user) }
        it "returns a success response" do
          get :show, params: { token: ticket.token }, session: valid_session
          expect(response).to be_success
        end
      end

      context "when user is not ticket holder" do
        it "should not allow to perform this action" do
          get :show, params: { token: ticket.token }, session: valid_session
          expect(response).not_to be_success
          expect(response).to redirect_to(root_path)
          expect(flash[:alert]).to eq("You are not allowed to perform this action")
        end
      end
    end

    context "when user is not logged in" do
      it "should redirect to new user session path" do
        get :show, params: { token: ticket.token }, session: valid_session
        expect(response).not_to be_success
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
