require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "photo must have name" do
  	@photo = Photo.new(name: "",
  					   description: "stuff")

  	refute @photo.valid?
  end

  test "photo must have description" do
  	@photo = Photo.new(name: "cool photo",
  					   description: "")

  	refute @photo.valid?
  end

  test "generates slug" do
  	@photo = Photo.new(name: "cool photo",
  					   description: "stuff")
  	@photo.save

  	assert_equal "cool-photo", @photo.slug
  end
end
