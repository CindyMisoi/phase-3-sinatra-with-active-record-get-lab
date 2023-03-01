class ApplicationController < Sinatra::Base
  # Add this line to set the Content-Type header for all responses
 set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
     # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
   # look up the bakery in the database using its ID
   bakery = Bakery.find(params[:id])
   bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_good = BakedGood.all.order(price: :desc)
    baked_good.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good =  BakedGood.all.order(price: :asc).last
    baked_good.to_json
  end
end
