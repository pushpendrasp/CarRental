require 'test_helper'

class RegisterMailersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @register_mailer = register_mailers(:one)
  end

  test "should get index" do
    get register_mailers_url
    assert_response :success
  end

  test "should get new" do
    get new_register_mailer_url
    assert_response :success
  end

  test "should create register_mailer" do
    assert_difference('RegisterMailer.count') do
      post register_mailers_url, params: { register_mailer: { car_id: @register_mailer.car_id, customer_id: @register_mailer.customer_id } }
    end

    assert_redirected_to register_mailer_url(RegisterMailer.last)
  end

  test "should show register_mailer" do
    get register_mailer_url(@register_mailer)
    assert_response :success
  end

  test "should get edit" do
    get edit_register_mailer_url(@register_mailer)
    assert_response :success
  end

  test "should update register_mailer" do
    patch register_mailer_url(@register_mailer), params: { register_mailer: { car_id: @register_mailer.car_id, customer_id: @register_mailer.customer_id } }
    assert_redirected_to register_mailer_url(@register_mailer)
  end

  test "should destroy register_mailer" do
    assert_difference('RegisterMailer.count', -1) do
      delete register_mailer_url(@register_mailer)
    end

    assert_redirected_to register_mailers_url
  end
end
