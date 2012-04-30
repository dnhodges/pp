require 'test_helper'

class DriverSchedulesControllerTest < ActionController::TestCase
  setup do
    @driver_schedule = driver_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:driver_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver_schedule" do
    assert_difference('DriverSchedule.count') do
      post :create, driver_schedule: @driver_schedule.attributes
    end

    assert_redirected_to driver_schedule_path(assigns(:driver_schedule))
  end

  test "should show driver_schedule" do
    get :show, id: @driver_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver_schedule
    assert_response :success
  end

  test "should update driver_schedule" do
    put :update, id: @driver_schedule, driver_schedule: @driver_schedule.attributes
    assert_redirected_to driver_schedule_path(assigns(:driver_schedule))
  end

  test "should destroy driver_schedule" do
    assert_difference('DriverSchedule.count', -1) do
      delete :destroy, id: @driver_schedule
    end

    assert_redirected_to driver_schedules_path
  end
end
