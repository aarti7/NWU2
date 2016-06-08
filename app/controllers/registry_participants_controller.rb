class RegistryParticipantsController < ApplicationController
  before_action :set_registry_participant, only: [:show, :edit, :update, :destroy]

  # GET /registry_participants
  # GET /registry_participants.json
  def index
    @registry_participants = RegistryParticipant.all
  end

  # GET /registry_participants/1
  # GET /registry_participants/1.json
  def show
  end

  # GET /registry_participants/new
  def new
    @registry_participant = RegistryParticipant.new
  end

  # GET /registry_participants/1/edit
  def edit
  end

  # POST /registry_participants
  # POST /registry_participants.json
  def create
    @registry_participant = RegistryParticipant.new(registry_participant_params)

    respond_to do |format|
      if @registry_participant.save
        format.html { redirect_to @registry_participant, notice: 'Registry participant was successfully created.' }
        format.json { render :show, status: :created, location: @registry_participant }
      else
        format.html { render :new }
        format.json { render json: @registry_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registry_participants/1
  # PATCH/PUT /registry_participants/1.json
  def update
    respond_to do |format|
      if @registry_participant.update(registry_participant_params)
        format.html { redirect_to @registry_participant, notice: 'Registry participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry_participant }
      else
        format.html { render :edit }
        format.json { render json: @registry_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registry_participants/1
  # DELETE /registry_participants/1.json
  def destroy
    @registry_participant.destroy
    respond_to do |format|
      format.html { redirect_to registry_participants_url, notice: 'Registry participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry_participant
      @registry_participant = RegistryParticipant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_participant_params
      params.require(:registry_participant).permit(:registry_id, :participant_id)
    end
end
