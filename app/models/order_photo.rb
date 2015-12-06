class OrderPhoto < ActiveRecord::Base
	belongs_to :order
	belongs_to :photo

	def size
		Size.find(size_id)
	end
end
