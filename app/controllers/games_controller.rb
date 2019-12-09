class GamesController < ApplicationController
    
    get '/games' do #index view all games
        redirect_if_not_logged_in
        @games = current_user.games
        erb :'/games/index'
    end

    get '/games/new' do
        erb :'/games/new'
    end

    post '/games' do
        redirect_if_not_logged_in
        game = Game.new(game_params)
        if game.save
            redirect to '/games'
        else
            @errors = [params.to_s]
            erb :failure
        end
    end

    get '/games/:id/edit' do #move stuff to helper method
        redirect_if_not_logged_in
        set_game
        erb :'/games/edit'
    end

    patch '/games/:id' do
        redirect_if_not_logged_in
        set_game
        if @game.update(game_params)
            redirect '/games'
        else
            @errors = ["cannot update"]
            erb :failure
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
            @errors = ["Invalid game id"]
            redirect '/'
        end
    end
end