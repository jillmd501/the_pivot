class City < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
  validates :image_path, presence: true
  validates :short_d, presence: true
  validates :long_d, presence: true
  has_many :trips
  before_save :set_slug

  def to_param
    self.slug
  end

  def set_slug
    self.slug = self.name.parameterize
  end
end
