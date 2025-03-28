require "test_helper"

class Admin::TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_transactions_index_url
    assert_response :success
  end

  test "should get approve" do
    get admin_transactions_approve_url
    assert_response :success
  end

  test "should get reject" do
    get admin_transactions_reject_url
    assert_response :success
  end
end
