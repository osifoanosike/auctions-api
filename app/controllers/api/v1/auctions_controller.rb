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

			#this handles the api post request
			def create
			    @current_user = User.find_by(id: 5)
			  	@auctionItem = @current_user.auction_items.build(auction_params)

			    @auctionItem.absolute_url =  "#{request.protocol}#{request.host_with_port}#{ @auctionItem.image}"
			    
			  	if @auctionItem.save
			  		# flash[:success] = "Auction item was successfully added, #{@auctionItem.absolute_url}"
			  		render json: @auctionItem, status: :created
			  	else
			  		render json: @auctionsItem.errors, status: :unprocessable_entity
			  	end
			end

			private

				def auction_params
					params.require(:auction_item).permit(:code, :name, :decription, :status, :quantity) if params[:auction_item]
				end
		end
	end
end
