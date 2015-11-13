class City < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
  validates :image_path, presence: true
  has_many :trips
end
