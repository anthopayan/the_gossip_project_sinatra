
require_relative 'gossip.rb'

class ApplicationController < Sinatra::Base #application qui hérite de la base sinatra
    get '/' do #Displays all messages in the home menu
      erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new/' do
        erb :new_gossip
    end

    post '/gossips/new/' do #create a new message
      Gossip.new(params["gossip_author"], params["gossip_content"]).save
      redirect '/'
    end
    
    get '/gossips/all/' do #Displays all messages
      erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/:id/' do #Displays the messages in the url corresponding to the message
      erb :show
    end
   
end
