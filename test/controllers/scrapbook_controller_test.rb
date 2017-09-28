require 'test_helper'

class ScrapbookControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scrapbook_new_url
    assert_response :success
  end

  test "should get show" do
    get scrapbook_show_url
    assert_response :success
  end

  test "should get update" do
    get scrapbook_update_url
    assert_response :success
  end

  test "should get create" do
    get scrapbook_create_url
    assert_response :success
  end

end
