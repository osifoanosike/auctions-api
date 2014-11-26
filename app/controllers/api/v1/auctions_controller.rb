module Api
	module V1
		class AuctionsController < ApplicationController
			
			def index
				@auctions = AuctionItem.all

				render json: @auctions
				# respond_to do |format|
				# 	format.json { render json: @auctions }
				# 	format.xml { render xml: auctions }
				# end			
			end

		end
	end
end
