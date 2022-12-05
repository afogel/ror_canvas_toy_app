require "application_system_test_case"

class RawImagesTest < ApplicationSystemTestCase
  setup do
    @raw_image = raw_images(:one)
  end

  test "visiting the index" do
    visit raw_images_url
    assert_selector "h1", text: "Raw images"
  end

  test "should create raw image" do
    visit raw_images_url
    click_on "New raw image"

    click_on "Create Raw image"

    assert_text "Raw image was successfully created"
    click_on "Back"
  end

  test "should update Raw image" do
    visit raw_image_url(@raw_image)
    click_on "Edit this raw image", match: :first

    click_on "Update Raw image"

    assert_text "Raw image was successfully updated"
    click_on "Back"
  end

  test "should destroy Raw image" do
    visit raw_image_url(@raw_image)
    click_on "Destroy this raw image", match: :first

    assert_text "Raw image was successfully destroyed"
  end
end
