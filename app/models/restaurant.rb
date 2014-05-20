class Restaurant < ActiveRecord::Base
	 validates :name, presence: true, format: {with: /\A[A-Z]/}
	 validates :address, presence: true, length:{  minimum: 3}
	 validates :cuisine, presence: true

	# validates :address, :length => { :in => 5..255 }

end