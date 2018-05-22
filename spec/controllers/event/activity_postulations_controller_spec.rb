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

RSpec.describe Event::ActivityPostulationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Event::Activity::Postulation. As you add validations to Event::Activity::Postulation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryBot.attributes_for(:event_activity_postulation)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:event_activity_postulation, :invalid)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Event::ActivityPostulationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:event) { Event.last || FactoryBot.create(:event) }

  describe "GET #index" do
    it "returns a success response" do
      activity_postulation = Event::Activity::Postulation.create! valid_attributes
      get :index, params: { event_id: event.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      activity_postulation = Event::Activity::Postulation.create! valid_attributes
      get :show, params: { event_id: event.to_param, id: activity_postulation.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { event_id: event.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      activity_postulation = Event::Activity::Postulation.create! valid_attributes
      get :edit, params: { event_id: event.to_param, id: activity_postulation.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event::Activity::Postulation" do
        expect {
          post :create, params: { event_id: event.to_param, event_activity_postulation: valid_attributes }, session: valid_session
        }.to change(Event::Activity::Postulation, :count).by(1)
      end

      it "redirects to the created event_activity_postulation" do
        post :create, params: { event_id: event.to_param, event_activity_postulation: valid_attributes }, session: valid_session
        last_postulation = Event::Activity::Postulation.last
        expect(response).to redirect_to(event_activities_postulation_path(event_id: last_postulation.event.to_param, id: last_postulation.to_param))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { event_id: event.to_param, event_activity_postulation: invalid_attributes }, session: valid_session
        expect(response.status).to eq 200
        expect(response).to render_template("event/activity_postulations/new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryBot.attributes_for(:event_activity_postulation)
      }

      it "updates the requested event_activity_postulation" do
        activity_postulation = Event::Activity::Postulation.create! valid_attributes
        put :update, params: { event_id: event.to_param, id: activity_postulation.to_param, event_activity_postulation: new_attributes }, session: valid_session
        activity_postulation.reload
        expect(activity_postulation.postulant_firstname).to eq new_attributes[:postulant_firstname]
        expect(activity_postulation.activity_title).to eq new_attributes[:activity_title]
        expect(activity_postulation.activity_description).to eq new_attributes[:activity_description]
      end

      it "redirects to the event_activity_postulation" do
        activity_postulation = Event::Activity::Postulation.create! valid_attributes
        put :update, params: { event_id: event.to_param, id: activity_postulation.to_param, event_activity_postulation: valid_attributes }, session: valid_session
        expect(response).to redirect_to(event_activities_postulation_path(event_id: activity_postulation.event.to_param, id: activity_postulation.to_param))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        activity_postulation = Event::Activity::Postulation.create! valid_attributes
        put :update, params: { event_id: event.to_param, id: activity_postulation.to_param, event_activity_postulation: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event_activity_postulation" do
      activity_postulation = Event::Activity::Postulation.create! valid_attributes
      expect {
        delete :destroy, params: { event_id: event.to_param, id: activity_postulation.to_param }, session: valid_session
      }.to change(Event::Activity::Postulation, :count).by(-1)
    end

    it "redirects to the event_activity_postulations list" do
      activity_postulation = Event::Activity::Postulation.create! valid_attributes
      delete :destroy, params: { event_id: event.to_param, id: activity_postulation.to_param }, session: valid_session
      expect(response).to redirect_to(event_activities_postulations_url(event_id: event.to_param))
    end
  end

end
