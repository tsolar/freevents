require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe EventsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:event)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:event, :invalid)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :show, params: { id: event.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    context "when user is not logged in" do
      it "redirects to new user session path" do
        get :new, params: {}, session: valid_session
        expect(response).not_to be_success
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user is logged in" do
      login_user

      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "GET #edit" do
    context "when user is not logged in" do
      it "redirects to new user session path" do
        event = Event.create! valid_attributes
        get :edit, params: { id: event.to_param }, session: valid_session
        expect(response).not_to be_success
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user is logged in" do
      login_user

      context "when user is owner of the event" do
        it "returns a success response" do
          event = Event.create! valid_attributes.merge(owner: @user)
          get :edit, params: { id: event.to_param }, session: valid_session
          expect(assigns(:event).owner).to eq @user
          expect(response).to be_success
        end
      end

      context "when user is not owner of the event" do
        it "rendirects back with flash message" do
          event = Event.create! valid_attributes
          event_owner = event.owner
          get :edit, params: { id: event.to_param }, session: valid_session
          expect(assigns(:event).owner).not_to eq @user
          expect(assigns(:event).owner).to eq event_owner
          expect(response).to redirect_to root_path
          expect(flash[:alert]).to include(I18n.t("unauthorized"))
        end
      end
    end
  end

  describe "POST #create" do
    context "when user is logged in" do
      login_user
      context "with valid params" do
        it "creates a new Event" do
          expect {
            post :create, params: { event: valid_attributes }, session: valid_session
          }.to change(Event, :count).by(1)
          expect(Event.last.owner).to eq @user
        end

        it "redirects to the created event" do
          post :create, params: { event: valid_attributes }, session: valid_session
          expect(response).to redirect_to(Event.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { event: invalid_attributes }, session: valid_session
          expect(response).to be_success
        end
      end
    end

    context "when user is not logged in" do
      context "with valid params" do
        it "does not create a new Event" do
          expect {
            post :create, params: { event: valid_attributes }, session: valid_session
          }.to change(Event, :count).by(0)
          # TODO: check days, venues
        end

        it "redirects to new user session path" do
          post :create, params: { event: valid_attributes }, session: valid_session
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "with invalid params" do
        it "redirects to new user session path" do
          post :create, params: { event: invalid_attributes }, session: valid_session
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      FactoryBot.attributes_for(:event, valid_attributes.merge(title: "other title"))
    }
    let(:event) { Event.create! valid_attributes }

    context "when user is logged in" do
      login_user

      let(:event) { Event.create! valid_attributes.merge(owner: @user) }

      context "with valid params" do
        it "updates the requested event" do
          put :update, params: { id: event.to_param, event: new_attributes }, session: valid_session
          event.reload
          expect(event.title).to eq "other title"
        end

        it "redirects to the event" do
          put :update, params: { id: event.to_param, event: valid_attributes }, session: valid_session
          expect(response).to redirect_to(event)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          put :update, params: { id: event.to_param, event: invalid_attributes }, session: valid_session
          expect(response).to be_success
        end
      end
    end

    context "when usser is not logged in" do
      context "with valid params" do
        it "does not update the requested event" do
          put :update, params: { id: event.to_param, event: new_attributes }, session: valid_session
          event.reload
          expect(event.title).to eq valid_attributes[:title]
        end

        it "redirects to new user session path" do
          put :update, params: { id: event.to_param, event: valid_attributes }, session: valid_session
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "with invalid params" do
        it "redirects to new user session path" do
          put :update, params: { id: event.to_param, event: invalid_attributes }, session: valid_session
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "when user is logged in" do
      login_user

      it "destroys the requested event" do
        # Can't use `let!` because it runs before `login_user`,
        # and user is needed to create the event.
        # So let's create the `event` just like this.
        event = Event.create! valid_attributes.merge(owner: @user)
        expect {
          delete :destroy, params: { id: event.to_param }, session: valid_session
        }.to change(Event, :count).by(-1)
      end

      it "redirects to the events list" do
        event = Event.create! valid_attributes.merge(owner: @user)
        delete :destroy, params: { id: event.to_param }, session: valid_session
        expect(response).to redirect_to(events_url)
      end
    end

    context "when user is not logged in" do
      it "destroys the requested event" do
        event = Event.create! valid_attributes
        expect {
          delete :destroy, params: { id: event.to_param }, session: valid_session
        }.to change(Event, :count).by(0)
        # TODO: check days, venues
      end

      it "redirects to new user session path" do
        event = Event.create! valid_attributes
        delete :destroy, params: { id: event.to_param }, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "PUT #respond_attendance" do
    let!(:event) { FactoryBot.create(:event) }

    context "when user is not logged in" do
      it "redirects to new user session path" do
        expect {
          put :respond_attendance, params: { id: event.to_param, will_attend: "yes" }, session: valid_session
        }.to change(Event::Participation, :count).by(0)
          .and change(Entity::Person, :count).by(0)
          .and change(User, :count).by(0)
          .and change(Ticket, :count).by(0)

        expect(response).to redirect_to new_user_session_path
      end
    end

    context "when user is logged in" do
      login_user

      context "and when user is event owner" do
        # let(:event) { FactoryBot.create(:event, owner: @user) }

        it "should not create an event participation" do
          skip "Not sure if deny or not to event owner to be a participant"
        end
      end

      context "and when user is not event owner" do
        before :each do
          expect(event.owner).not_to eq @user
        end

        context "and when user.person does not exist" do
          it "should save the participation, the answer, and create the person" do
            expect {
              put :respond_attendance, params: { id: event.to_param, will_attend: "yes" }, session: valid_session
            }.to change(Event::Participation, :count).by(1)
              .and change(Entity::Person, :count).by(1)
              .and change(User, :count).by(0)
              .and change(Ticket, :count).by(1)
            event_participation = Event::Participation.where(
              event: event,
              participant: Entity::Person.where(user: @user).first
            ).first
            expect(event_participation).not_to be nil
            expect(event_participation).to be_a Event::Participation
            expect(event_participation.participant).to eq @user.person
            expect(@user.person.firstname).to eq Mail::Address.new(@user.email).local
            expect(@user.person.lastname).to eq nil

            # expect(response).to redirect_to root_path
            notice = "Your answer was successfully registered"
            expect(flash[:alert]).to eq nil # I18n.t("unauthorized")
            expect(flash[:notice]).to eq notice # I18n.t("unauthorized")
          end
        end

        context "and when user.person exists" do
          context "and user is already registered to event (participation exists)" do
            before :each do
              # User is already registered to event if exists an Event::Participation related
              FactoryBot.create(
                :event_attendee,
                participant: FactoryBot.create(:entity_person, user: @user)
              )
              expect(@user.person).to be_a(Entity::Person)
              expect(@user.person).to be_present

            end

            let(:answer) { "who knows" }
            let(:ticket_count) { 0 }

            context "answer is an allowed answer" do
              context "and answer is yes" do
                let(:answer) { "yes" }
                let(:ticket_count) { 1 }
                it "should save the event participation" do
                end
              end

              context "and answer is no" do
                let(:answer) { "no" }

                it "should save the event participation" do
                end
              end

              context "and answer is maybe" do
                let(:answer) { "maybe" }

                it "should save the event participation" do
                end
              end

              after :each do
                expect {
                  put :respond_attendance, params: { id: event.to_param, will_attend: answer }, session: valid_session
                }.to change(Event::Participation, :count).by(0)
                  .and change(Entity::Person, :count).by(0)
                  .and change(User, :count).by(0)
                  .and change(Ticket, :count).by(ticket_count)

                event_participation = Event::Participation.where(
                  event: event,
                  participant: Entity::Person.where(user: @user).first
                ).first

                expect(event_participation.answer.will_attend).to eq answer
              end
            end

            context "and answer is not yes, no, or maybe" do
              it "should not save the event participation" do
                event_participation_answer = Event::Participation.where(
                  event: event,
                  participant: Entity::Person.where(user: @user).first
                ).first.answer

                expect {
                  put :respond_attendance, params: { id: event.to_param, will_attend: answer }, session: valid_session
                }.to change(Event::Participation, :count).by(0)
                  .and change(Entity::Person, :count).by(0)
                  .and change(User, :count).by(0)

                event_participation = Event::Participation.where(
                  event: event,
                  participant: Entity::Person.where(user: @user).first
                ).first

                expect(event_participation.answer.will_attend).to eq event_participation_answer.will_attend

              end
            end

          end

          context "and user is not registered to event (participation does not exist)" do
            before :each do
              @user.person = FactoryBot.create(:entity_person)
              expect(@user.person).to be_a(Entity::Person)
              expect(@user.person).to be_present
            end

            let(:answer) { "who knows" }

            context "and answer is yes" do
              let(:answer) { "yes" }

              it "should create the event participation" do
                expect {
                  put :respond_attendance, params: { id: event.to_param, will_attend: answer }, session: valid_session
                }.to change(Event::Participation, :count).by(1)
                  .and change(Entity::Person, :count).by(0)
                  .and change(User, :count).by(0)

                event_participation = Event::Participation.where(
                  event: event,
                  participant: Entity::Person.where(user: @user).first
                ).first

                expect(event_participation.answer.will_attend).to eq "yes"
              end
            end

            context "and answer is no" do
              let(:answer) { "no" }

              it "should create the event participation" do
                expect {
                  put :respond_attendance, params: { id: event.to_param, will_attend: answer }, session: valid_session
                }.to change(Event::Participation, :count).by(1)
                  .and change(Entity::Person, :count).by(0)
                  .and change(User, :count).by(0)

                event_participation = Event::Participation.where(
                  event: event,
                  participant: Entity::Person.where(user: @user).first
                ).first

                expect(event_participation.answer.will_attend).to eq "no"
              end
            end
            context "and answer is maybe" do
              let(:answer) { "maybe" }

              it "should create the event participation" do
                expect {
                  put :respond_attendance, params: { id: event.to_param, will_attend: answer }, session: valid_session
                }.to change(Event::Participation, :count).by(1)
                  .and change(Entity::Person, :count).by(0)
                  .and change(User, :count).by(0)

                event_participation = Event::Participation.where(
                  event: event,
                  participant: Entity::Person.where(user: @user).first
                ).first

                expect(event_participation.answer.will_attend).to eq "maybe"
              end
            end

            context "and answer is not yes, no, or maybe" do
              it "should create the event participation but with nil as answer" do
                expect {
                  put :respond_attendance, params: { id: event.to_param, will_attend: answer }, session: valid_session
                }.to change(Event::Participation, :count).by(1)
                  .and change(Entity::Person, :count).by(0)
                  .and change(User, :count).by(0)

                event_participation = Event::Participation.where(
                  event: event,
                  participant: Entity::Person.where(user: @user).first
                ).first

                expect(event_participation.answer.will_attend).to eq nil
              end
            end
          end
        end
      end
    end
  end
end
