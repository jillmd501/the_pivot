class Business < ActiveRecord::Base
	validates_presence_of :name, :location, :bio
  has_many :photos
  has_many :user_businesses
  has_many :users, through: :user_businesses

  def toggle_status
  	status = self.status
  	if status == "Online"
  		status = "Oflline"
  	elsif status == "Offline"
  		status = "Online"
  	end
  	self.save
  end
end
