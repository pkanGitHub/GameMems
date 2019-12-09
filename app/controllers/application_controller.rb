class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"
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
                redirect '/sessions/login'
            end
        end

        def current_user
            User.find(session[:user_id])
        end
    end
end