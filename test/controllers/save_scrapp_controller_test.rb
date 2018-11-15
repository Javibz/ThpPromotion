require 'test_helper'

class SaveScrappControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get save_scrapp_generate_url
    assert_response :success
  end

end
