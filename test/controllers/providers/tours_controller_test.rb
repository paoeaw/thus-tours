require 'test_helper'

class Providers::ToursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get providers_tours_index_url
    assert_response :success
  end

end
