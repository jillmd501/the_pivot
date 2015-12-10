require 'test_helper'

class ZipCreatorTest < ActiveSupport::TestCase
  def setup
  	@zip = ZipCreator.new
  end

  test "zip_filename is correct" do
  	assert_equal "Photos.zip", @zip.zip_filename
  end

  test "tmp_filename is correct" do
  	assert_equal "#{Rails.root}/tmp/Photos.zip", @zip.tmp_filename
  end

  test "stop method" do
  	ZipCreator.any_instance.stubs(:stop).returns("testtest")

  	assert_equal "testtest", @zip.stop
  end

  test "create method" do

  	ZipCreator.any_instance.stubs(:create).returns("test")

  	assert_equal "test", @zip.create
  end

end
