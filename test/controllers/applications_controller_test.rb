require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applications_index_url
    assert_response :success
  end

  test "should get new" do
    get applications_new_url
    assert_response :success
  end

  test "should get create" do
    get applications_create_url
    assert_response :success
  end

  test "should get edit" do
    get applications_edit_url
    assert_response :success
  end

  test "should get update" do
    get applications_update_url
    assert_response :success
  end

  test "should get destroy" do
    get applications_destroy_url
    assert_response :success
  end

end
