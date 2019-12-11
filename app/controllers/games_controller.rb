class GamesController < ApplicationController
    
    get '/games' do #index view all games
        redirect_if_not_logged_in
        @games = current_user.games
        erb :'/games/index'
    end

    get '/games/new' do #add game 
        erb :'/games/new'
    end

    post '/games' do #create game
        redirect_if_not_logged_in
        game = Game.new(game_params)
        if game.save
            redirect to '/games'
        else
            #game already exist
            @errors = [params.to_s]
            erb :failure
        end
    end

    get '/games/:id/edit' do 
        #move stuff to helper method
        redirect_if_not_logged_in
        set_game
        erb :'/games/edit'
    end

    patch '/games/:id' do #update a game
        redirect_if_not_logged_in
        set_game
        if @game.update(game_params)
            redirect '/games'
        else
            flash[:error] = "Cannot Update"
            redirect '/games/edit'
        end
    end

    delete '/games/:id/delete' do
        @game = Game.find_by_id(params[:id])
        @game.delete
        redirect "/games"
    end


    private
    def game_params
        {name: params[:name], platform: params[:platform], mode: params[:mode], user: current_user}
    end

    def set_game
        @game = Game.find_by(id: params[:id])
        unless @game
            flash[:error] = "Cannot find game ID"
            redirect '/'
        end
    end
end