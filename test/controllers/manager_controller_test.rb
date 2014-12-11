require 'test_helper'

class ManagerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get guests" do
    get :guests
    assert_response :success
  end

end
