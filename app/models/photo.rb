class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { thumbnail: "64x64", small:"480x320", med: "960x640", large: "1920x1280" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :business
  belongs_to :category
  has_many :order_photos, dependent: :destroy
  has_many :orders, through: :order_photos
  validates_presence_of :name, :description, :slug
  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
