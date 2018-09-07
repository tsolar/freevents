class Event::ActivitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event
  before_action :set_event_activity, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /event/activities
  # GET /event/activities.json
  def index
    @event_activities = @event.activities
    authorize Event::Activity
  end

  # GET /event/activities/1
  # GET /event/activities/1.json
  def show
  end

  # GET /event/activities/new
  def new
    @event_activity = Event::Activity.new
    @event_activity.event_day = @event.days.last
    authorize @event_activity
  end

  # GET /event/activities/1/edit
  def edit
  end

  # POST /event/activities
  # POST /event/activities.json
  def create
    @event_activity = Event::Activity.new(event_activity_params)
    @event_activity.event_day = @event.days.last if @event_activity.event_day.nil?
    authorize @event_activity

    respond_to do |format|
      if @event_activity.save
        format.html { redirect_to event_activity_path(event_id: @event.to_param, id: @event_activity.to_param), notice: "#{Event::Activity.model_name.human} #{t('actions.messages.success.created_f')}." }
        format.json { render :show, status: :created, location: @event_activity }
      else
        format.html { render :new }
        format.json { render json: @event_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event/activities/1
  # PATCH/PUT /event/activities/1.json
  def update
    respond_to do |format|
      if @event_activity.update(event_activity_params)
        format.html { redirect_to event_activity_path(event_id: @event.to_param, id: @event_activity.to_param), notice: "#{Event::Activity.model_name.human} #{t('actions.messages.success.updated_f')}." }
        format.json { render :show, status: :ok, location: @event_activity }
      else
        format.html { render :edit }
        format.json { render json: @event_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/activities/1
  # DELETE /event/activities/1.json
  def destroy
    @event_activity.destroy
    respond_to do |format|
      format.html { redirect_to event_activities_url, notice: "#{Event::Activity.model_name.human} #{t('actions.messages.success.destroyed_f')}." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity
      @event_activity = Event::Activity.joins(:event_day)
        .where(event_days: { event_id: @event.to_param }).find_by(id: params[:id])
      if @event_activity.present?
        authorize @event_activity
      else
        render_404
      end
    end

    def set_event
      @event = Event.find(params[:event_id])
    rescue
      render_404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_activity_params
      params.require(:event_activity).permit(:type, :event_day_id, :title, :description, :starts_at, :ends_at, :venue_room_id)
    end
end
