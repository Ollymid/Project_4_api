require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log = logs(:one)
  end

  test "should get index" do
    get logs_url, as: :json
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post logs_url, params: { log: { comments: @log.comments, country: @log.country, date: @log.date, dive_site_id: @log.dive_site_id, dive_time: @log.dive_time, dive_type: @log.dive_type, gear: @log.gear, image: @log.image, temperature: @log.temperature, user_id: @log.user_id, visibility: @log.visibility, water_type: @log.water_type } }, as: :json
    end

    assert_response 201
  end

  test "should show log" do
    get log_url(@log), as: :json
    assert_response :success
  end

  test "should update log" do
    patch log_url(@log), params: { log: { comments: @log.comments, country: @log.country, date: @log.date, dive_site_id: @log.dive_site_id, dive_time: @log.dive_time, dive_type: @log.dive_type, gear: @log.gear, image: @log.image, temperature: @log.temperature, user_id: @log.user_id, visibility: @log.visibility, water_type: @log.water_type } }, as: :json
    assert_response 200
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete log_url(@log), as: :json
    end

    assert_response 204
  end
end
