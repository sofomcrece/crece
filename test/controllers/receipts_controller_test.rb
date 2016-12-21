require 'test_helper'

class ReceiptsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get crear" do
    get :crear
    assert_response :success
  end

  test "should get baja" do
    get :baja
    assert_response :success
  end

end
