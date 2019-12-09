require './config/environment'

class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"

        register Sinatra::Flash
    end

    get "/" do
        erb :home
    end

    helpers do 
        def logged_in?     
            !!session[:user_id]
        end

        def redirect_if_not_logged_in
            unless logged_in?
                flash[:message] = "Oops, NOT LOG IN YET!"
                redirect '/sessions/login'
            end
        end

        def current_user
            User.find(session[:user_id])
        end

        def game_exists?(item_name)
            current_user.games.each do |game|
              if game_name == game.name 
                flash[:error] = "Couldn't add item: Item already in inventory."
                redirect "/items/new"
              end
            end
        end
    end
end