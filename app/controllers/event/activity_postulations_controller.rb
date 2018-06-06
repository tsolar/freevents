class Event::ActivityPostulationsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_event
  before_action :set_event_activity_postulation, only: [:show, :edit, :update, :destroy, :approve]
  after_action :verify_authorized

  # GET /event/activity_postulations
  # GET /event/activity_postulations.json
  def index
    @event_activity_postulations = Event::Activity::Postulation.where(event: @event)
    authorize @event, :update?
  end

  # GET /event/activity_postulations/1
  # GET /event/activity_postulations/1.json
  def show
  end

  # GET /event/activity_postulations/new
  def new
    @event_activity_postulation = Event::Activity::Postulation.new
    authorize @event_activity_postulation
  end

  # GET /event/activity_postulations/1/edit
  def edit
  end

  # POST /event/activity_postulations
  # POST /event/activity_postulations.json
  def create
    @event_activity_postulation = Event::Activity::Postulation.new(event_activity_postulation_params)
    authorize @event_activity_postulation

    respond_to do |format|
      if @event_activity_postulation.save
        format.html { redirect_to @event, notice: 'Activity postulation was successfully created.' }
        format.json { render :show, status: :created, location: @event_activity_postulation }
      else
        format.html { render :new }
        format.json { render json: @event_activity_postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event/activity_postulations/1
  # PATCH/PUT /event/activity_postulations/1.json
  def update
    respond_to do |format|
      if @event_activity_postulation.update(event_activity_postulation_params)
        format.html { redirect_to event_activities_postulation_path(event_id: @event_activity_postulation.event.to_param, id: @event_activity_postulation.to_param), notice: 'Activity postulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_activity_postulation }
      else
        format.html { render :edit }
        format.json { render json: @event_activity_postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/activity_postulations/1
  # DELETE /event/activity_postulations/1.json
  def destroy
    @event_activity_postulation.destroy
    respond_to do |format|
      format.html { redirect_to event_activities_postulations_url(event_id: @event.id), notice: 'Activity postulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @event_activity_postulation.approve
    respond_to do |format|
      format.html { redirect_to event_activities_postulations_url(event_id: @event.id), notice: 'Activity postulation was successfully approved.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity_postulation
      @event_activity_postulation = Event::Activity::Postulation.find_by(id: params[:id], event_id: @event.to_param)
      if @event_activity_postulation.present?
        authorize @event_activity_postulation
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
    def event_activity_postulation_params
      params.require(:event_activity_postulation).permit(
        :postulant_firstname,
        :postulant_lastname,
        :postulant_email,
        :postulant_phone_number,
        :postulant_bio,
        :activity_type,
        :activity_title,
        :activity_description,
        :activity_estimated_duration,
        :activity_difficulty_level,
        :activity_preferred_time
      ).merge!(event_id: @event.id)
    end
end
