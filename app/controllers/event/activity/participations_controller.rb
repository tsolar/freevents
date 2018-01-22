class Event::Activity::ParticipationsController < ApplicationController
  before_action :set_event_activity_participation, only: [:show, :edit, :update, :destroy]

  # GET /event/activity/participations
  # GET /event/activity/participations.json
  def index
    @event_activity_participations = Event::Activity::Participation.all
  end

  # GET /event/activity/participations/1
  # GET /event/activity/participations/1.json
  def show
  end

  # GET /event/activity/participations/new
  def new
    @event_activity_participation = Event::Activity::Participation.new
  end

  # GET /event/activity/participations/1/edit
  def edit
  end

  # POST /event/activity/participations
  # POST /event/activity/participations.json
  def create
    @event_activity_participation = Event::Activity::Participation.new(event_activity_participation_params)

    respond_to do |format|
      if @event_activity_participation.save
        format.html { redirect_to @event_activity_participation, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @event_activity_participation }
      else
        format.html { render :new }
        format.json { render json: @event_activity_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event/activity/participations/1
  # PATCH/PUT /event/activity/participations/1.json
  def update
    respond_to do |format|
      if @event_activity_participation.update(event_activity_participation_params)
        format.html { redirect_to @event_activity_participation, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_activity_participation }
      else
        format.html { render :edit }
        format.json { render json: @event_activity_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/activity/participations/1
  # DELETE /event/activity/participations/1.json
  def destroy
    @event_activity_participation.destroy
    respond_to do |format|
      format.html { redirect_to event_activity_participations_url, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity_participation
      @event_activity_participation = Event::Activity::Participation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_activity_participation_params
      params.require(:event_activity_participation).permit(:event_activity_id, :event_participation_id, :type)
    end
end
