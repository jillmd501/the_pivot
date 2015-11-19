class Trip < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_path, presence: true
  validates :city_id, presence: true
  belongs_to :city

  before_save :set_slug

  enum status: %w(Active Retired)

  def to_param
    self.slug
  end

  def set_slug
    self.slug = self.name.parameterize
  end

  def self.active_trips(city)
    city.trips.where(status: 0)
  end
end
