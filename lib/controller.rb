
require_relative 'gossip.rb'

class ApplicationController < Sinatra::Base #application qui hérite de la base sinatra
    get '/' do
      erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new/' do
        erb :new_gossip
    end

    post '/gossips/new/' do
      Gossip.new(params["gossip_author"], params["gossip_content"]).save
      redirect '/'
    end
    
    get '/gossips/all/' do
      erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/:id/' do
      erb :show
    end
   
end
