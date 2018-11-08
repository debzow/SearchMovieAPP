require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get movies_search_url
    assert_response :success
  end

  test "should get result" do
    get movies_result_url
    assert_response :success
  end

end
