require "test_helper"

class CreategamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creategame = creategames(:one)
  end

  test "should get index" do
    get creategames_url
    assert_response :success
  end

  test "should get new" do
    get new_creategame_url
    assert_response :success
  end

  test "should create creategame" do
    assert_difference("Creategame.count") do
      post creategames_url, params: { creategame: { game_url: @creategame.game_url, name: @creategame.name, user_id: @creategame.user_id } }
    end

    assert_redirected_to creategame_url(Creategame.last)
  end

  test "should show creategame" do
    get creategame_url(@creategame)
    assert_response :success
  end

  test "should get edit" do
    get edit_creategame_url(@creategame)
    assert_response :success
  end

  test "should update creategame" do
    patch creategame_url(@creategame), params: { creategame: { game_url: @creategame.game_url, name: @creategame.name, user_id: @creategame.user_id } }
    assert_redirected_to creategame_url(@creategame)
  end

  test "should destroy creategame" do
    assert_difference("Creategame.count", -1) do
      delete creategame_url(@creategame)
    end

    assert_redirected_to creategames_url
  end
end
