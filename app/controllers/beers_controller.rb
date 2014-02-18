class BeersController < ApplicationController
	before_filter :get_beer, only: [:show, :edit, :update, :destroy]

	def index
		@beers = Beer.all
	end

	def show
	end

	def new
		@beer = Beer.new
	end

	def create
		@beer = Beer.new(beer_params)
		respond_to do |format|
			if @beer.save
				format.html { redirect_to beers_path, notice: 'Beer was successfully created.' }
				format.json { render action: 'show', status: :created, location: @beer }
			else
				format.html { render action: 'new' }
				format.json { render json: @beer.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @beer.update(beer_params)
				format.html { redirect_to beers_path, notice: 'Beer was successfully updated.' }
				format.json { render action: 'show', status: :created, location: @beer }
			else
				format.html { render action: 'show' }
				format.json { render json: @beer.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
	end

	def dash
		@beers = Beer.joins(:location).where(locations: { status: ['NEXT','LOW','SERVING'] }).order(:location_id)
	end

private

	def get_beer
		@beer = Beer.find(params[:id])
	end

	def beer_params
		params.require(:beer).permit(:name, :brewer_id, :format_id, :price, :style_id, :abv, :note, :location_id)
	end

end
