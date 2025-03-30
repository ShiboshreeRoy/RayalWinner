require "application_system_test_case"

class CreategamesTest < ApplicationSystemTestCase
  setup do
    @creategame = creategames(:one)
  end

  test "visiting the index" do
    visit creategames_url
    assert_selector "h1", text: "Creategames"
  end

  test "should create creategame" do
    visit creategames_url
    click_on "New creategame"

    fill_in "Game url", with: @creategame.game_url
    fill_in "Name", with: @creategame.name
    fill_in "User", with: @creategame.user_id
    click_on "Create Creategame"

    assert_text "Creategame was successfully created"
    click_on "Back"
  end

  test "should update Creategame" do
    visit creategame_url(@creategame)
    click_on "Edit this creategame", match: :first

    fill_in "Game url", with: @creategame.game_url
    fill_in "Name", with: @creategame.name
    fill_in "User", with: @creategame.user_id
    click_on "Update Creategame"

    assert_text "Creategame was successfully updated"
    click_on "Back"
  end

  test "should destroy Creategame" do
    visit creategame_url(@creategame)
    accept_confirm { click_on "Destroy this creategame", match: :first }

    assert_text "Creategame was successfully destroyed"
  end
end
