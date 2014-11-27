class AuctionSerializer < ActiveModel::Serializer
  
  embed :id

  attributes :id, :code, :name, :desscription, :status, :quantity

  has_one :user
end
