require "test_helper"

class JoggingTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jogging_time = jogging_times(:one)
  end

  test "should get index" do
    get jogging_times_url, as: :json
    assert_response :success
  end

  test "should create jogging_time" do
    assert_difference("JoggingTime.count") do
      post jogging_times_url, params: { jogging_time: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show jogging_time" do
    get jogging_time_url(@jogging_time), as: :json
    assert_response :success
  end

  test "should update jogging_time" do
    patch jogging_time_url(@jogging_time), params: { jogging_time: {  } }, as: :json
    assert_response :success
  end

  test "should destroy jogging_time" do
    assert_difference("JoggingTime.count", -1) do
      delete jogging_time_url(@jogging_time), as: :json
    end

    assert_response :no_content
  end
end
