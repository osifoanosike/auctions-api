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
			    @current_user = User.find_by(id: 1)

			    @auctionItem = AuctionItem.new(params[:id])
			  	# @auctionItem = @current_user.auction_items.build(auction_params)
			  	@auctionItem.user_id = @current_user.id
			    # @auctionItem.absolute_url =  "#{request.protocol}#{request.host_with_port}#{ @auctionItem.image}"
			    
			  	if @auctionItem.save
			  		# flash[:success] = "Auction item was successfully added, #{@auctionItem.absolute_url}"
			  		render json: @auctionItem, status: :created
			  	else
			  		render json: @auctionsItem.errors, status: :unprocessable_entity
			  	end
			end

			def show
				@auction = AuctionItem.find_by(id: params[:id])
				render json: @auction
			end

			private

				def auction_params
					params.require(:auction_item).permit(:code, :name, :decription, :status, :quantity) if params[:auction_item]
				end
		end
	end
end
