class Event::Activity::PostulationsController < ApplicationController
  before_action :set_event_activity_postulation, only: [:show, :edit, :update, :destroy]

  # GET /event/activity/postulations
  # GET /event/activity/postulations.json
  def index
    @event_activity_postulations = Event::Activity::Postulation.all
  end

  # GET /event/activity/postulations/1
  # GET /event/activity/postulations/1.json
  def show
  end

  # GET /event/activity/postulations/new
  def new
    @event_activity_postulation = Event::Activity::Postulation.new
  end

  # GET /event/activity/postulations/1/edit
  def edit
  end

  # POST /event/activity/postulations
  # POST /event/activity/postulations.json
  def create
    @event_activity_postulation = Event::Activity::Postulation.new(event_activity_postulation_params)

    respond_to do |format|
      if @event_activity_postulation.save
        format.html { redirect_to @event_activity_postulation, notice: "Postulation was successfully created." }
        format.json { render :show, status: :created, location: @event_activity_postulation }
      else
        format.html { render :new }
        format.json { render json: @event_activity_postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event/activity/postulations/1
  # PATCH/PUT /event/activity/postulations/1.json
  def update
    respond_to do |format|
      if @event_activity_postulation.update(event_activity_postulation_params)
        format.html { redirect_to @event_activity_postulation, notice: "Postulation was successfully updated." }
        format.json { render :show, status: :ok, location: @event_activity_postulation }
      else
        format.html { render :edit }
        format.json { render json: @event_activity_postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/activity/postulations/1
  # DELETE /event/activity/postulations/1.json
  def destroy
    @event_activity_postulation.destroy
    respond_to do |format|
      format.html { redirect_to event_activity_postulations_url, notice: "Postulation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity_postulation
      @event_activity_postulation = Event::Activity::Postulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_activity_postulation_params
      params.require(:event_activity_postulation).permit(:event_id, :postulant_firstname, :postulant_lastname, :postulant_email, :postulant_phone_number, :postulant_bio, :activity_type, :activity_title, :activity_description, :activity_estimated_duration, :activity_difficulty_level, :activity_preferred_time)
    end
end
