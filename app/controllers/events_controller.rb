class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :respond_attendance]
  after_action :verify_authorized

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    authorize @events
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.days.build
    authorize Event
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.owner = current_user
    authorize @event
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "#{Event.model_name.human} #{t('actions.messages.success.created')}." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html {
          @event.days.build if @event.days.empty?
          render :new
        }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "#{Event.model_name.human} #{t('actions.messages.success.updated')}." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "#{Event.model_name.human} #{t('actions.messages.success.destroyed')}." }
      format.json { head :no_content }
    end
  end

  def respond_attendance
    answer = params[:will_attend]
    person = current_user.person
    if person.nil?
      person = current_user.create_person(
        firstname: Mail::Address.new(current_user.email).local
      )
    end
    participation = Event::Attendee.where(
      event: @event,
      participant: person # person must exist!
    ).first_or_create

    if participation.answer.update(will_attend: answer)
      notice = "#{Event::Participation::Answer.model_name.human} #{t('actions.messages.success.registered_f')}."
      respond_to do |format|
        format.html { redirect_to events_url, notice: notice }
        format.json { render json: @event, notice: notice }
      end
    else
      respond_to do |format|
        format.html { redirect_to events_url, notice: t("event/participation/answer.messages.there_was_a_problem") }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by(id: params[:id])
      if @event.present?
        authorize @event
      else
        render_404
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
        :title,
        :description,
        days_attributes: [
          :id,
          :_destroy,
          :starts_at,
          :ends_at
        ],
        venues_attributes: [
          :id,
          :_destroy,
          :name,
          :description,
          :address,
          :lat,
          :lng
        ]
      )
    end
end
