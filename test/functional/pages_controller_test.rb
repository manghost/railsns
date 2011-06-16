require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should_show_index" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:page)
  end
end
