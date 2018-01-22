class Event::ActivitiesController < ApplicationController
  before_action :set_event_activity, only: [:show, :edit, :update, :destroy]

  # GET /event/activities
  # GET /event/activities.json
  def index
    @event_activities = Event::Activity.all
  end

  # GET /event/activities/1
  # GET /event/activities/1.json
  def show
  end

  # GET /event/activities/new
  def new
    @event_activity = Event::Activity.new
  end

  # GET /event/activities/1/edit
  def edit
  end

  # POST /event/activities
  # POST /event/activities.json
  def create
    @event_activity = Event::Activity.new(event_activity_params)

    respond_to do |format|
      if @event_activity.save
        format.html { redirect_to @event_activity, notice: 'Activity was successfully created.' }
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
        format.html { redirect_to @event_activity, notice: 'Activity was successfully updated.' }
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
      format.html { redirect_to event_activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity
      @event_activity = Event::Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_activity_params
      params.require(:event_activity).permit(:type, :event_day_id, :title, :description, :starts_at, :ends_at)
    end
end
