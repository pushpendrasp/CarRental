require 'test_helper'

class CarSuggestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_suggestion = car_suggestions(:one)
  end

  test "should get index" do
    get car_suggestions_url
    assert_response :success
  end

  test "should get new" do
    get new_car_suggestion_url
    assert_response :success
  end

  test "should create car_suggestion" do
    assert_difference('CarSuggestion.count') do
      post car_suggestions_url, params: { car_suggestion: { manufacturer: @car_suggestion.manufacturer, model: @car_suggestion.model, style: @car_suggestion.style } }
    end

    assert_redirected_to car_suggestion_url(CarSuggestion.last)
  end

  test "should show car_suggestion" do
    get car_suggestion_url(@car_suggestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_suggestion_url(@car_suggestion)
    assert_response :success
  end

  test "should update car_suggestion" do
    patch car_suggestion_url(@car_suggestion), params: { car_suggestion: { manufacturer: @car_suggestion.manufacturer, model: @car_suggestion.model, style: @car_suggestion.style } }
    assert_redirected_to car_suggestion_url(@car_suggestion)
  end

  test "should destroy car_suggestion" do
    assert_difference('CarSuggestion.count', -1) do
      delete car_suggestion_url(@car_suggestion)
    end

    assert_redirected_to car_suggestions_url
  end
end
