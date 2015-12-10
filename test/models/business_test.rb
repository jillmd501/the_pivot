require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  test "business must have name" do
  	@business = Business.new(name: "",
  					   location: "stuff",
  					   bio: "stuff nad things")

  	refute @business.valid?
  end

  test "business must have location" do
  	@business = Business.new(name: "cool business",
  					   location: "",
  					   bio: "stuff nad things")

  	refute @business.valid?
  end

  test "business must have bio" do
  	@business = Business.new(name: "cool business",
  					   location: "stuff",
  					   bio: "")

  	refute @business.valid?
  end

  test "generates slug" do
  	@business = Business.new(name: "cool business",
  					   location: "stuff",
  					   bio: "stuff nad things")
  	@business.save

  	assert_equal "cool-business", @business.slug
  end
end
