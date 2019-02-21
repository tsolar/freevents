# frozen_string_literal: true

class Venue::RoomsController < ApplicationController
  before_action :set_venue_room, only: %i[show edit update destroy]

  # GET /venue/rooms
  # GET /venue/rooms.json
  def index
    @venue_rooms = Venue::Room.all
  end

  # GET /venue/rooms/1
  # GET /venue/rooms/1.json
  def show
  end

  # GET /venue/rooms/new
  def new
    @venue_room = Venue::Room.new
  end

  # GET /venue/rooms/1/edit
  def edit
  end

  # POST /venue/rooms
  # POST /venue/rooms.json
  def create
    @venue_room = Venue::Room.new(venue_room_params)

    respond_to do |format|
      if @venue_room.save
        format.html { redirect_to @venue_room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @venue_room }
      else
        format.html { render :new }
        format.json { render json: @venue_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venue/rooms/1
  # PATCH/PUT /venue/rooms/1.json
  def update
    respond_to do |format|
      if @venue_room.update(venue_room_params)
        format.html { redirect_to @venue_room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @venue_room }
      else
        format.html { render :edit }
        format.json { render json: @venue_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venue/rooms/1
  # DELETE /venue/rooms/1.json
  def destroy
    @venue_room.destroy
    respond_to do |format|
      format.html { redirect_to venue_rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venue_room
    @venue_room = Venue::Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def venue_room_params
    params.require(:venue_room).permit(:venue_id, :name, :capacity)
  end
end
