require 'test_helper'

class StudentcoursesControllerTest < ActionController::TestCase
  test "should get coursesout" do
    get :coursesout
    assert_response :success
  end

end
