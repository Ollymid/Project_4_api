require 'test_helper'

class DiveSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dive_site = dive_sites(:one)
  end

  test "should get index" do
    get dive_sites_url, as: :json
    assert_response :success
  end

  test "should create dive_site" do
    assert_difference('DiveSite.count') do
      post dive_sites_url, params: { dive_site: { dive_type: @dive_site.dive_type, image: @dive_site.image, lat: @dive_site.lat, lng: @dive_site.lng, max_depth: @dive_site.max_depth, name: @dive_site.name, water_type: @dive_site.water_type } }, as: :json
    end

    assert_response 201
  end

  test "should show dive_site" do
    get dive_site_url(@dive_site), as: :json
    assert_response :success
  end

  test "should update dive_site" do
    patch dive_site_url(@dive_site), params: { dive_site: { dive_type: @dive_site.dive_type, image: @dive_site.image, lat: @dive_site.lat, lng: @dive_site.lng, max_depth: @dive_site.max_depth, name: @dive_site.name, water_type: @dive_site.water_type } }, as: :json
    assert_response 200
  end

  test "should destroy dive_site" do
    assert_difference('DiveSite.count', -1) do
      delete dive_site_url(@dive_site), as: :json
    end

    assert_response 204
  end
end
