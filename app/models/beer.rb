class Beer < ActiveRecord::Base
	belongs_to :brewer
	belongs_to :style
	belongs_to :location
	belongs_to :format
	
	validates :name, length: { maximum: 254 }

	def self.markup(method)
		if method == "tap"
			return 2.811
		else
			return 2
		end
	end

	def self.wastage
		0.05
	end

	def self.pricefor(id, serving, method)
		volume = self.joins(:format).select("formats.size").find(id).size
		(self.find(id).price) / (volume - (volume * self.wastage)) / 1000 * serving * self.markup(method)
	end

	def self.ontap
		@beers = self.joins(:location,:brewer).where(locations: { status: ['LOW','SERVING'] }).select("beers.id, brewers.name AS brewer_name, beers.name, beers.price, locations.name AS currently")
	end

end