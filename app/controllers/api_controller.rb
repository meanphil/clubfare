class ApiController < ApplicationController

	def index
	end

	def beers
		@beers = Beer.ontap
		render :json=>@beers, :except => :id
	end

end
