class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { thumbnail: "64x64", small:"480x320", med: "960x640", large: "1920x1280" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :business
  belongs_to :order
end
