class SessionsController < ApplicationController
    get '/signup' do
        @title = "Signing Up"
        erb :'/sessions/signup'
    end

    post '/signup' do
        user = User.new(user_params)
        if user.save
            redirect '/login'
        else
            flash[:warning] = "Username already exist, choose another username!"
            redirect "/signup"
        end
    end

    get '/login' do
        @title = "Logging In"
        erb :'/sessions/login'
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to '/games'
        else
            flash[:warning] = "Incorrect username or password"
            redirect "/login"
        end
    end

    private
    
    def user_params
        {username: params[:username], password: params[:password]}
    end
end