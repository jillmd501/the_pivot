require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "photo must have name" do
  	photo = Photo.new(name: "",
  					   description: "stuff")

  	refute photo.valid?
  end

  test "photo must have description" do
  	photo = Photo.new(name: "cool photo",
  					   description: "")

  	refute photo.valid?
  end

  test "generates slug" do
  	photo = Photo.new(name: "cool photo",
  					   description: "stuff")
  	photo.save

  	assert_equal "cool-photo", photo.slug
  end

  test "sized photo url" do
    photo = Photo.new(name: "cool photo",
                      description: "stuff",
                      )
    photo.image = open('/Users/rossedfort/Pictures/pivotphotos/andrew.jpg')
    photo.save!

    assert_equal photo.image.url(:med), photo.sized_photo_url(:med)
  end

end
