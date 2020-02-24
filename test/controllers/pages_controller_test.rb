require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pages_new_url
    assert_response :success
  end

  test "should get score" do
    get pages_score_url
    assert_response :success
  end

end
