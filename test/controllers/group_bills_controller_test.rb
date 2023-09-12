require 'test_helper'

class GroupBillsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get group_bills_index_url
    assert_response :success
  end

  test 'should get show' do
    get group_bills_show_url
    assert_response :success
  end

  test 'should get new' do
    get group_bills_new_url
    assert_response :success
  end

  test 'should get edit' do
    get group_bills_edit_url
    assert_response :success
  end
end
