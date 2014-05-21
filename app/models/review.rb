class Review < ActiveRecord::Base
	belongs_to :restaurant
	validates :rating, inclusion:{in: 1..5, message:"Rating must be 1-5"}
end
