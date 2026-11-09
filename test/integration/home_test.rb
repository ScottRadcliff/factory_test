require "test_helper"

class HomeTest < ActionDispatch::IntegrationTest
  test "home page loads" do
    get root_url
    assert_response :success
  end

  test "home page displays the app heading" do
    get root_url
    assert_select "h1", text: "Factory Test App", count: 1
  end
end
