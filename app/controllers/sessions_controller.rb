class SessionsController < ApplicationController
    get '/signup' do
        erb :'/sessions/signup'
    end

    post '/signup' do
        user = User.new(user_params)
        if user.save
            redirect '/login'
        else
            @errors = ["Signup failed"]
            erb :failure
        end
    end

    get '/login' do
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
            redirect to '/login'
        end
    end

    private
    
    def user_params
        {username: params[:username], password: params[:password]}
    end
end