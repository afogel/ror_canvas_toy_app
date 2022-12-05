require "test_helper"

class RawImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raw_image = raw_images(:one)
  end

  test "should get index" do
    get raw_images_url
    assert_response :success
  end

  test "should get new" do
    get new_raw_image_url
    assert_response :success
  end

  test "should create raw_image" do
    assert_difference("RawImage.count") do
      post raw_images_url, params: { raw_image: {  } }
    end

    assert_redirected_to raw_image_url(RawImage.last)
  end

  test "should show raw_image" do
    get raw_image_url(@raw_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_raw_image_url(@raw_image)
    assert_response :success
  end

  test "should update raw_image" do
    patch raw_image_url(@raw_image), params: { raw_image: {  } }
    assert_redirected_to raw_image_url(@raw_image)
  end

  test "should destroy raw_image" do
    assert_difference("RawImage.count", -1) do
      delete raw_image_url(@raw_image)
    end

    assert_redirected_to raw_images_url
  end
end
