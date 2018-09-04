class Event::DaysController < ApplicationController
  before_action :set_event_day, only: [:show, :edit, :update, :destroy]

  # GET /event/days
  # GET /event/days.json
  def index
    @event_days = Event::Day.all
  end

  # GET /event/days/1
  # GET /event/days/1.json
  def show
  end

  # GET /event/days/new
  def new
    @event_day = Event::Day.new
  end

  # GET /event/days/1/edit
  def edit
  end

  # POST /event/days
  # POST /event/days.json
  def create
    @event_day = Event::Day.new(event_day_params)

    respond_to do |format|
      if @event_day.save
        format.html { redirect_to @event_day, notice: "Day was successfully created." }
        format.json { render :show, status: :created, location: @event_day }
      else
        format.html { render :new }
        format.json { render json: @event_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event/days/1
  # PATCH/PUT /event/days/1.json
  def update
    respond_to do |format|
      if @event_day.update(event_day_params)
        format.html { redirect_to @event_day, notice: "Day was successfully updated." }
        format.json { render :show, status: :ok, location: @event_day }
      else
        format.html { render :edit }
        format.json { render json: @event_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event/days/1
  # DELETE /event/days/1.json
  def destroy
    @event_day.destroy
    respond_to do |format|
      format.html { redirect_to event_days_url, notice: "Day was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event_day
    @event_day = Event::Day.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_day_params
    params.require(:event_day).permit(:event_id, :date, :start_time, :end_time)
  end
end
