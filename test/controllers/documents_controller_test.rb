require "test_helper"

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy_policy" do
    get documents_privacy_policy_url
    assert_response :success
  end
end
