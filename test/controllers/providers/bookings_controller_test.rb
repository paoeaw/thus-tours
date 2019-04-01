require 'test_helper'

class Providers::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get providers_bookings_index_url
    assert_response :success
  end

end
