require 'test_helper'

class Twitter::FunctionsControllerTest < ActionController::TestCase
  test "should get timeline" do
    get :timeline
    assert_response :success
  end

end
