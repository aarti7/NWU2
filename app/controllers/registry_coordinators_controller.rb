class RegistryCoordinatorsController < ApplicationController
  before_action :set_registry_coordinator, only: [:show, :edit, :update, :destroy]

  # GET /registry_coordinators
  # GET /registry_coordinators.json
  def index
    @registry_coordinators = RegistryCoordinator.all
  end

  # GET /registry_coordinators/1
  # GET /registry_coordinators/1.json
  def show
  end

  # GET /registry_coordinators/new
  def new
    @registry_coordinator = RegistryCoordinator.new
  end

  # GET /registry_coordinators/1/edit
  def edit
  end

  # POST /registry_coordinators
  # POST /registry_coordinators.json
  def create
    @registry_coordinator = RegistryCoordinator.new(registry_coordinator_params)

    respond_to do |format|
      if @registry_coordinator.save
        format.html { redirect_to @registry_coordinator, notice: 'Registry coordinator was successfully created.' }
        format.json { render :show, status: :created, location: @registry_coordinator }
      else
        format.html { render :new }
        format.json { render json: @registry_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registry_coordinators/1
  # PATCH/PUT /registry_coordinators/1.json
  def update
    respond_to do |format|
      if @registry_coordinator.update(registry_coordinator_params)
        format.html { redirect_to @registry_coordinator, notice: 'Registry coordinator was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry_coordinator }
      else
        format.html { render :edit }
        format.json { render json: @registry_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registry_coordinators/1
  # DELETE /registry_coordinators/1.json
  def destroy
    @registry_coordinator.destroy
    respond_to do |format|
      format.html { redirect_to registry_coordinators_url, notice: 'Registry coordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry_coordinator
      @registry_coordinator = RegistryCoordinator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_coordinator_params
      params.require(:registry_coordinator).permit(:registry_id, :coordinator_id)
    end
end
