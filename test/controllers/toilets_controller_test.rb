require "test_helper"

class ToiletsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get toilets_index_url
    assert_response :success
  end

  test "should get show" do
    get toilets_show_url
    assert_response :success
  end
end
