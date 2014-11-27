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


			def create
			    @current_user = User.find_by(id: 5)
			  	@auctionItem = @current_user.auction_items.build(auction_params)

			    @auctionItem.absolute_url =  "#{request.protocol}#{request.host_with_port}#{ @auctionItem.image}"
			    
			  	if @auctionItem.save
			  		flash[:success] = "Auction item was successfully added, #{@auctionItem.absolute_url}"
			  		redirect_to auctions_path
			  	else
			  		render 'new'
			  	end
			end


		end
	end
end
