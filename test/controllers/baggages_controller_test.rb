require 'test_helper'

class BaggagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @baggage = baggages(:one)
  end

  test "should get index" do
    get baggages_url, as: :json
    assert_response :success
  end

  test "should create baggage" do
    assert_difference('Baggage.count') do
      post baggages_url, params: { baggage: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show baggage" do
    get baggage_url(@baggage), as: :json
    assert_response :success
  end

  test "should update baggage" do
    patch baggage_url(@baggage), params: { baggage: {  } }, as: :json
    assert_response 200
  end

  test "should destroy baggage" do
    assert_difference('Baggage.count', -1) do
      delete baggage_url(@baggage), as: :json
    end

    assert_response 204
  end
end
