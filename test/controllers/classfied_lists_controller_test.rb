require 'test_helper'

class ClassfiedListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get classfied_lists_index_url
    assert_response :success
  end

end
