class Restaurant < ActiveRecord::Base
	validates :name, length:{in: 1.255}
	
end
