class Restaurant < ActiveRecord::Base
	validates :name, :length => { :in => 1..255 }
	validates :address, :length => { :in => 5..255 }

end
