require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    
    get '/' do
      erb :'pirates/index'
    end
    
    get '/new' do
      erb :'pirates/new'
    end
    
    post '/pirates' do 
      
      # @pirate = Pirate.new(params[:pirate])
      
      @pirate = Pirate.new(name: params[:pirate][:name], weight: params[:pirate][:weight], height: params[:pirate][:height])
      
      params[:pirate][:ships].each do |ship|
        @ships << Ship.new(name: ship[:name], type: ship[:type], booty: ship[:booty])
      end
      
      
      erb :'pirates/show'
    end

  end
end
