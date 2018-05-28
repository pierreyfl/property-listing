require 'test_helper'

class AnalyticsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get analytics_show_url
    assert_response :success
  end

end
