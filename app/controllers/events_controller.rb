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
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
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
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def respond_attendance
    answer = params[:will_attend]
    participation = Event::Attendee.where(
      event: @event,
      participant: Entity::Person.where(user: current_user).first_or_create
    ).first_or_create
    if participation.answer.update(will_attend: answer)
      notice = "Your answer was successfully registered"
      respond_to do |format|
        format.html { redirect_to events_url, notice: notice }
        format.json { render json: @event, notice: notice }
      end
    else
      respond_to do |format|
        format.html { redirect_to events_url, notice: "There was an problem registering your answer. Please, try again" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      authorize @event
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
        :title,
        :description,
        days_attributes: [
          :id,
          :_destroy,
          :date,
          :start_time,
          :end_time
        ]
      )
    end
end
