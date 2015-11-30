require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
    test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Nationwide Mortgage"
  end

	test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Nationwide Mortgage"
  end

end
