class City < ActiveRecord::Base
  has_many :categories
end
