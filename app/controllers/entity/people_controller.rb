class Entity::PeopleController < ApplicationController
  before_action :set_entity_person, only: [:show, :edit, :update, :destroy]

  # GET /entity/people
  # GET /entity/people.json
  def index
    @entity_people = Entity::Person.all
  end

  # GET /entity/people/1
  # GET /entity/people/1.json
  def show
  end

  # GET /entity/people/new
  def new
    @entity_person = Entity::Person.new
  end

  # GET /entity/people/1/edit
  def edit
  end

  # POST /entity/people
  # POST /entity/people.json
  def create
    @entity_person = Entity::Person.new(entity_person_params)

    respond_to do |format|
      if @entity_person.save
        format.html { redirect_to @entity_person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @entity_person }
      else
        format.html { render :new }
        format.json { render json: @entity_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entity/people/1
  # PATCH/PUT /entity/people/1.json
  def update
    respond_to do |format|
      if @entity_person.update(entity_person_params)
        format.html { redirect_to @entity_person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity_person }
      else
        format.html { render :edit }
        format.json { render json: @entity_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity/people/1
  # DELETE /entity/people/1.json
  def destroy
    @entity_person.destroy
    respond_to do |format|
      format.html { redirect_to entity_people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_person
      @entity_person = Entity::Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_person_params
      params.require(:entity_person).permit(:firstname, :lastname, :dob, :bio)
    end
end
