class GamesController < ApplicationController
    
    get '/games' do #index view all games
        # redirect_if_not_logged_in
        if logged_in?
            @games = current_user.games
            @title = "Game List"
            erb :'/games/index'
        else
            flash[:error] = "Need to Log In First!"
            redirect '/'
        end
    end

    get '/games/new' do #add game 
        @title = "Add Game"
        erb :'/games/new'
    end

    post '/games' do #create game
        redirect_if_not_logged_in
        game = Game.new(game_params)
        if game.save 
            redirect to '/games'
        else
            flash[:error] = game.errors.full_messages.join
            redirect to '/games/new'
        end
    end

    get '/games/:id/edit' do 
        #move stuff to helper method
        redirect_if_not_logged_in
        set_game
        @title = "Edit Game"
        redirect_if_not_same_user(@game.user_id)
        erb :'/games/edit'
    end

    patch '/games/:id' do #update a game
        set_game
        if @game.update(game_params)
            redirect '/games'
        else
            flash[:error] = "Update Fails"
            redirect '/games'
        end
    end

    delete '/games/:id/delete' do
        @game = Game.find_by_id(params[:id])
        #@game.user_id == current_user.id
        redirect_if_not_same_user(@game.user_id)
        @game.delete
        redirect "/games"
    end


    private
    def game_params
        {name: params[:name], platform: params[:platform], mode: params[:mode], user: current_user}
    end

    def set_game
        @game = Game.find(params[:id])
        unless @game
            flash[:error] = "Cannot find game ID"
            redirect '/'
        end
    end

end