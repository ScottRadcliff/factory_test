require "test_helper"

class HomeTest < ActionDispatch::IntegrationTest
  test "home page loads" do
    get root_url
    assert_response :success
    assert_select "h1", "Factory Test"
  end
end
