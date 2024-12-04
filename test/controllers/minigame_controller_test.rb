require "test_helper"

class MinigameControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get minigame_index_url
    assert_response :success
  end
end
