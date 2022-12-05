require "application_system_test_case"

class LabelsTest < ApplicationSystemTestCase
  setup do
    @label = labels(:one)
  end

  test "visiting the index" do
    visit labels_url
    assert_selector "h1", text: "Labels"
  end

  test "should create label" do
    visit labels_url
    click_on "New label"

    fill_in "Kind", with: @label.kind
    fill_in "Name", with: @label.name
    click_on "Create Label"

    assert_text "Label was successfully created"
    click_on "Back"
  end

  test "should update Label" do
    visit label_url(@label)
    click_on "Edit this label", match: :first

    fill_in "Kind", with: @label.kind
    fill_in "Name", with: @label.name
    click_on "Update Label"

    assert_text "Label was successfully updated"
    click_on "Back"
  end

  test "should destroy Label" do
    visit label_url(@label)
    click_on "Destroy this label", match: :first

    assert_text "Label was successfully destroyed"
  end
end
