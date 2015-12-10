class ZipCreator

  def create(tmp_filename, order_photos)
  	Zip::ZipFile.open(tmp_filename, Zip::ZipFile::CREATE) do |zip|
  	  order_photos.each do |order_photo|
      photo = order_photo.photo
      attachment = Paperclip.io_adapters.for(photo.image)
      zip.add(photo.image.original_filename, attachment.path)
      end
    end
  end
  
end