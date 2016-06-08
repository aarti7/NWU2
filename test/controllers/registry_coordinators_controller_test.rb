require 'test_helper'

class RegistryCoordinatorsControllerTest < ActionController::TestCase
  setup do
    @registry_coordinator = registry_coordinators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registry_coordinators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registry_coordinator" do
    assert_difference('RegistryCoordinator.count') do
      post :create, registry_coordinator: { coordinator_id: @registry_coordinator.coordinator_id, registry_id: @registry_coordinator.registry_id }
    end

    assert_redirected_to registry_coordinator_path(assigns(:registry_coordinator))
  end

  test "should show registry_coordinator" do
    get :show, id: @registry_coordinator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registry_coordinator
    assert_response :success
  end

  test "should update registry_coordinator" do
    patch :update, id: @registry_coordinator, registry_coordinator: { coordinator_id: @registry_coordinator.coordinator_id, registry_id: @registry_coordinator.registry_id }
    assert_redirected_to registry_coordinator_path(assigns(:registry_coordinator))
  end

  test "should destroy registry_coordinator" do
    assert_difference('RegistryCoordinator.count', -1) do
      delete :destroy, id: @registry_coordinator
    end

    assert_redirected_to registry_coordinators_path
  end
end
