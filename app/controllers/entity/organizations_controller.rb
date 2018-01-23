class Entity::OrganizationsController < ApplicationController
  before_action :set_entity_organization, only: [:show, :edit, :update, :destroy]

  # GET /entity/organizations
  # GET /entity/organizations.json
  def index
    @entity_organizations = Entity::Organization.all
  end

  # GET /entity/organizations/1
  # GET /entity/organizations/1.json
  def show
  end

  # GET /entity/organizations/new
  def new
    @entity_organization = Entity::Organization.new
  end

  # GET /entity/organizations/1/edit
  def edit
  end

  # POST /entity/organizations
  # POST /entity/organizations.json
  def create
    @entity_organization = Entity::Organization.new(entity_organization_params)

    respond_to do |format|
      if @entity_organization.save
        format.html { redirect_to @entity_organization, notice: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @entity_organization }
      else
        format.html { render :new }
        format.json { render json: @entity_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entity/organizations/1
  # PATCH/PUT /entity/organizations/1.json
  def update
    respond_to do |format|
      if @entity_organization.update(entity_organization_params)
        format.html { redirect_to @entity_organization, notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @entity_organization }
      else
        format.html { render :edit }
        format.json { render json: @entity_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity/organizations/1
  # DELETE /entity/organizations/1.json
  def destroy
    @entity_organization.destroy
    respond_to do |format|
      format.html { redirect_to entity_organizations_url, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_organization
      @entity_organization = Entity::Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_organization_params
      params.require(:entity_organization).permit(:type, :name)
    end
end
