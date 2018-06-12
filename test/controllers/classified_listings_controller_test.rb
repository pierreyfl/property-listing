require 'test_helper'

class ClassifiedListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classified_listing = classified_listings(:one)
  end

  test "should get index" do
    get classified_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_classified_listing_url
    assert_response :success
  end

  test "should create classified_listing" do
    assert_difference('ClassifiedListing.count') do
      post classified_listings_url, params: { classified_listing: { description: @classified_listing.description, title: @classified_listing.title } }
    end

    assert_redirected_to classified_listing_url(ClassifiedListing.last)
  end

  test "should show classified_listing" do
    get classified_listing_url(@classified_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_classified_listing_url(@classified_listing)
    assert_response :success
  end

  test "should update classified_listing" do
    patch classified_listing_url(@classified_listing), params: { classified_listing: { description: @classified_listing.description, title: @classified_listing.title } }
    assert_redirected_to classified_listing_url(@classified_listing)
  end

  test "should destroy classified_listing" do
    assert_difference('ClassifiedListing.count', -1) do
      delete classified_listing_url(@classified_listing)
    end

    assert_redirected_to classified_listings_url
  end
end
