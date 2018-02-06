require 'test_helper'

class SessionsControllersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sessions_controller = sessions_controllers(:one)
  end

  test "should get index" do
    get sessions_controllers_url
    assert_response :success
  end

  test "should get new" do
    get new_sessions_controller_url
    assert_response :success
  end

  test "should create sessions_controller" do
    assert_difference('SessionsController.count') do
      post sessions_controllers_url, params: { sessions_controller: {  } }
    end

    assert_redirected_to sessions_controller_url(SessionsController.last)
  end

  test "should show sessions_controller" do
    get sessions_controller_url(@sessions_controller)
    assert_response :success
  end

  test "should get edit" do
    get edit_sessions_controller_url(@sessions_controller)
    assert_response :success
  end

  test "should update sessions_controller" do
    patch sessions_controller_url(@sessions_controller), params: { sessions_controller: {  } }
    assert_redirected_to sessions_controller_url(@sessions_controller)
  end

  test "should destroy sessions_controller" do
    assert_difference('SessionsController.count', -1) do
      delete sessions_controller_url(@sessions_controller)
    end

    assert_redirected_to sessions_controllers_url
  end
end
