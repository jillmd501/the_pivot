class ZipCreator
  attr_reader :zip_filename, :tmp_filename

  def initialize
  	@zip_filename = "Photos.zip"
    @tmp_filename = "#{Rails.root}/tmp/#{zip_filename}"
    GC.disable
  end

  def create(order_photos)
  	Zip::ZipFile.open(tmp_filename, Zip::ZipFile::CREATE) do |zip|
  	  order_photos.each do |order_photo|
      photo = order_photo.photo
      attachment = Paperclip.io_adapters.for(photo.image)
      zip.add(photo.image.original_filename, attachment.path)
      end
    end
  end

  def stop
  	File.delete tmp_filename
    GC.enable
    GC.start
  end

end