class SessionsController < ApplicationController
    get '/signup' do
        erb :'/sessions/signup'
    end

    post '/signup' do
        user = User.new(user_params)
        if user.save
            redirect '/login'
        else
            flash[:error] = "Couldn't create the account"
            redirect "/signup"
        end
    end

    get '/login' do
        erb :'/sessions/login'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to '/games'
        else
            flash[:alert] = "Incorrect username or password"
            redirect "/login"
        end
    end

    private
    
    def user_params
        {username: params[:username], password: params[:password]}
    end
end