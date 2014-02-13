class Brewer < ActiveRecord::Base
	has_many :beers

	validates :name, length: { maximum: 254 }
end
