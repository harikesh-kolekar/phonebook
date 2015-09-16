require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get approved" do
    get :approved
    assert_response :success
  end

  test "should get declined" do
    get :declined
    assert_response :success
  end

  test "should get pending" do
    get :pending
    assert_response :success
  end

end
