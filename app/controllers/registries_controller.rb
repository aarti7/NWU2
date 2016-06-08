class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  # GET /registries
  # GET /registries.json
  def index
    @registries = Registry.all
  end

  # GET /registries/1
  # GET /registries/1.json
  def show
    coordinator_emails = []
    @registry.registry_coordinators.all.each do |registry_coord|
      coordinator_email =  Coordinator.find(registry_coord.coordinator_id).email
      coordinator_emails.push(coordinator_email)
    end
    coordinator_emails = coordinator_emails.uniq
    @coordinator_emails_string = coordinator_emails.map(&:inspect).join(', ')

    @participant_list = []
    @registry.registry_participants.all.each do |registry_data|
      participant =  Participant.find(registry_data.participant_id)
      if check_if_in_list(@participant_list,registry_data.participant_id).nil?
        @participant_list.push(participant)
      end
    end
  end

  # GET /registries/new
  def new
    @registry = Registry.new
  end

  # GET /registries/1/edit
  def edit
    puts params
    @registry = Registry.find(params[:id])
  end

  # POST /registries
  # POST /registries.json
  def create
    puts params
    @registry = Registry.new(registry_params)

    respond_to do |format|
      if @registry.save
        format.html { redirect_to @registry, notice: 'Registry was successfully created.' }
        format.json { render :show, status: :created, location: @registry }
      else
        format.html { render :new }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
    unless registry_params[:registry_coordinators_attributes].nil?
      registry_params[:registry_coordinators_attributes].each do |key,value|
          value = value.except(:_destroy)
  	      @registry_coordinator = @registry.registry_coordinators.new(value)
        	@registry_coordinator.save
      end
    end
  end

  # PATCH/PUT /registries/1
  # PATCH/PUT /registries/1.json
  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to @registry, notice: 'Registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end

    unless registry_params[:registry_coordinators_attributes].nil?
      registry_params[:registry_coordinators_attributes].each do |key,value|
        if value[:_destroy]=="1"
          @registry_coordinator = @registry.registry_coordinators.find(value[:id])
          @registry_coordinator.destroy
        end
      end
    end

  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to registries_url, notice: 'Registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_coordinators(registry)

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = Registry.find(params[:id])
    end

    def check_if_in_list(participants_list, par_id)
      participants_list.each do |el|
        if (el.id == par_id)
          return 1
        end
      end

      return nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_params
      params.require(:registry).permit(:id, :name, :location, :open, registry_coordinators_attributes:[:id, :coordinator_id, :_destroy])
    end
end
