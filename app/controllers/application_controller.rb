require './config/environment'

class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"

        register Sinatra::Flash
    end

    get "/" do
        @title = "GameMems"
        erb :home
    end

    helpers do 
        def logged_in?     
          !!session[:user_id]
        end

        def redirect_if_not_logged_in
            unless logged_in?
                redirect '/sessions/login'
            end
        end

        def redirect_if_not_same_user(user_id)
            unless user_id == current_user.id 
                flash[:warning] = "Sorry, No Permission For This Game ID."
                redirect '/games'
            end
        end

        def current_user
            User.find(session[:user_id])
        end
    end
end
