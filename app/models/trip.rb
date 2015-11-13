class Trip < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image_path, presence: true
  validates :city_id, presence: true
  belongs_to :city
end
