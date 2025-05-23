require "application_system_test_case"

class ListsTest < ApplicationSystemTestCase
  setup do
    @list = lists(:one)
  end

  test "visiting the index" do
    visit lists_url
    assert_selector "h1", text: "Lists"
  end

  test "should create list" do
    visit lists_url
    click_on "New list"

    fill_in "Army", with: @list.army_id
    fill_in "Id", with: @list.id
    fill_in "Name", with: @list.name
    fill_in "Note", with: @list.note
    fill_in "User", with: @list.user_id
    fill_in "Value", with: @list.value
    fill_in "Value target", with: @list.value_target
    click_on "Create List"

    assert_text "List was successfully created"
    click_on "Back"
  end

  test "should update List" do
    visit list_url(@list)
    click_on "Edit this list", match: :first

    fill_in "Army", with: @list.army_id
    fill_in "Id", with: @list.id
    fill_in "Name", with: @list.name
    fill_in "Note", with: @list.note
    fill_in "User", with: @list.user_id
    fill_in "Value", with: @list.value
    fill_in "Value target", with: @list.value_target
    click_on "Update List"

    assert_text "List was successfully updated"
    click_on "Back"
  end

  test "should destroy List" do
    visit list_url(@list)
    click_on "Destroy this list", match: :first

    assert_text "List was successfully destroyed"
  end
end
