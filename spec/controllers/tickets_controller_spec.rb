# frozen_string_literal: true

require "rails_helper"

RSpec.describe TicketsController, type: :controller do
  let(:valid_session) { {} }

  let(:user_person) do
    create(:entity_person, user: create(:user))
  end
  let(:holder) do
    create(
      :event_attendee,
      participant: user_person
    )
  end
  let(:ticket) { create(:ticket, holder: holder) }

  describe "GET #show" do
    context "when user is logged in" do
      login_user

      context "when user is ticket holder" do
        let(:user_person) { create(:entity_person, user: user) }

        it "returns a success response" do
          get :show, params: { token: ticket.token }, session: valid_session
          expect(response.status).to eq 200
        end
      end

      context "when user is not ticket holder" do
        it "does not allow to perform this action" do
          get :show, params: { token: ticket.token }, session: valid_session
          expect(response.status).not_to eq 200
          expect(response).to redirect_to(root_path)
          expect(flash[:alert]).to eq(I18n.t("unauthorized"))
        end
      end
    end

    context "when user is not logged in" do
      it "redirects to new user session path" do
        get :show, params: { token: ticket.token }, session: valid_session
        expect(response.status).not_to eq 200
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #scan" do
    context "when user is logged in" do
      login_user

      context "when user is ticket.event owner" do
        let(:event) { create(:event, owner: user) }
        let(:holder) do
          create(
            :event_attendee,
            event: event,
            participant: user_person
          )
        end

        context "when ticket was already scanned" do
          before do
            expect(ticket.scan).to be true
            expect(ticket.scanned?).to be true
            expect(ticket.scanned_at).to be_present
          end

          it "calls Ticket#scan and show already scanned message" do
            # expect(ticket).to receive(:scan).with(no_args).once.and_call_original
            expect_any_instance_of(Ticket).to receive(:scan).with(no_args).once.and_call_original

            get :scan, params: { token: ticket.token }, session: valid_session

            expect(flash[:notice]).to be_nil

            expect(flash[:error]).to be_present
            expect(flash[:error][:scanned]).to include I18n.t("activerecord.errors.models.ticket.attributes.scanned.already_scanned") # "Ticket was already scanned"

            ticket.reload
            expect(ticket.scanned).to be true
            expect(ticket.scanned_at).to be_present

            expect(response.status).to eq 200
          end
        end

        context "when ticket was not scanned yet" do
          before do
            expect(ticket.scanned).to be_nil
            expect(ticket.scanned_at).to be_nil
          end

          it "calls Ticket#scan and show success message" do
            # expect(ticket).to receive(:scan).with(no_args).once.and_call_original
            expect_any_instance_of(Ticket).to receive(:scan).with(no_args).once.and_call_original

            get :scan, params: { token: ticket.token }, session: valid_session

            expect(flash[:notice]).to be_present
            expect(flash[:notice]).to eq I18n.t("ticket.scanned.success")
            expect(flash[:error]).to be_nil

            ticket.reload
            expect(ticket.scanned).to be true
            expect(ticket.scanned_at).to be_present

            expect(response.status).to eq 200
          end
        end
      end

      context "when user is not ticket.event owner" do
        it "does not to call scan and redirect to root path with flash message" do
          expect_any_instance_of(Ticket).not_to receive(:scan)

          get :scan, params: { token: ticket.token }, session: valid_session
          expect(flash[:notice]).to be_nil

          expect(flash[:error]).to be_nil
          expect(flash[:alert]).to be_present
          expect(flash[:alert]).to eq I18n.t("unauthorized")

          ticket.reload
          expect(ticket.scanned).to be_nil
          expect(ticket.scanned_at).to be_nil

          expect(response.status).not_to eq 200
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context "when user is not logged in" do
      it "redirects to new user session path" do
        expect_any_instance_of(Ticket).not_to receive(:scan)
        get :scan, params: { token: ticket.token }, session: valid_session
        expect(response.status).not_to eq 200
        expect(response).to redirect_to(new_user_session_path)

        ticket.reload
        expect(ticket.scanned).to be_nil
        expect(ticket.scanned_at).to be_nil
      end
    end
  end
end
