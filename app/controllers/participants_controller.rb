class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
    @open_registries = get_open_registries
  end

  # GET /participants/1/edit
  def edit
    @open_registries = get_open_registries
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end

    unless participant_params[:registry_participants_attributes].nil?
      participant_params[:registry_participants_attributes].each do |key,value|
        print value[:id]
        print value
        if check_if_exists(value[:registry_id],@participant.id).nil?
          value = value.except(:_destroy)
          @registry_participant = @participant.registry_participants.new(value)
          @registry_participant.save
        end
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end

    unless participant_params[:registry_participants_attributes].nil?
      participant_params[:registry_participants_attributes].each do |key,value|
        if value[:_destroy]=="1"
          @registry_participant = check_if_exists(value[:registry_id])
          unless @registry_participant.nil?
            @registry_participant.destroy
          end
        end
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def get_open_registries
      registries = Registry.all
      open_registries = []
      registries.each do |registry|
        if(registry.open == true)
          open_registries.push(registry)
        end
      end
      return open_registries
    end

    def check_if_exists(registry_id,participant_id)
      RegistryParticipant.all.each do |reg|
        if (reg.registry_id==registry_id) and (reg.participant_id==participant_id)
          return reg
        else
          return nil
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:name, :gender, :date_of_birth, :date_of_enrollment, :contact_method, :remarks, :coordinator, registry_participants_attributes:[:id, :registry_id, :_destroy])
    end
end
