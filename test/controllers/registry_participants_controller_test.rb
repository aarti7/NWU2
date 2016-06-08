require 'test_helper'

class RegistryParticipantsControllerTest < ActionController::TestCase
  setup do
    @registry_participant = registry_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registry_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registry_participant" do
    assert_difference('RegistryParticipant.count') do
      post :create, registry_participant: { participant_id: @registry_participant.participant_id, registry_id: @registry_participant.registry_id }
    end

    assert_redirected_to registry_participant_path(assigns(:registry_participant))
  end

  test "should show registry_participant" do
    get :show, id: @registry_participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registry_participant
    assert_response :success
  end

  test "should update registry_participant" do
    patch :update, id: @registry_participant, registry_participant: { participant_id: @registry_participant.participant_id, registry_id: @registry_participant.registry_id }
    assert_redirected_to registry_participant_path(assigns(:registry_participant))
  end

  test "should destroy registry_participant" do
    assert_difference('RegistryParticipant.count', -1) do
      delete :destroy, id: @registry_participant
    end

    assert_redirected_to registry_participants_path
  end
end
