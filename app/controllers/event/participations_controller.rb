class Event::ParticipationsController < ApplicationController
  before_action :set_event_participation, only: [:show, :edit, :update, :destroy]

  # GET /event/participations
  # GET /event/participations.json
  def index
    @event_participations = Event::Participation.all
  end

  # GET /event/participations/1
  # GET /event/participations/1.json
  def show
  end

  # GET /event/participations/new
  def new
    @event_participation = Event::Participation.new
  end

  # GET /event/participations/1/edit
  def edit
  end

  # POST /event/participations
  # POST /event/participations.json
  def create
    @event_participation = Event::Participation.new(event_participation_params)

    respond_to do |format|
      if @event_participation.save
        format.html { redirect_to @event_participation, notice: "Participation was successfully created." }
        format.json { render :show, status: :created, location: @event_participation }
      else
        format.html { render :new }
        format.json { render json: @event_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event/participations/1
  # PATCH/PUT /event/participations/1.json
  def update
    respond_to do |format|
      if @event_participation.update(event_participation_params)
        format.html { redirect_to @event_participation, notice: "Participation was successfully updated." }
        format.json { render :show, status: :ok, location: @event_participation }
      else
        format.html { render :edit }
        format.json { render json: @event_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/participations/1
  # DELETE /event/participations/1.json
  def destroy
    @event_participation.destroy
    respond_to do |format|
      format.html { redirect_to event_participations_url, notice: "Participation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_participation
      @event_participation = Event::Participation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_participation_params
      params.require(:event_participation).permit(:event_id, :type, :participant_id, :participant_type, :description)
    end
end
