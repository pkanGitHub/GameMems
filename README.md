# GamesCollections

Save and Edit games you've played

* Create errors to user
  * Get /failure

* Create a user account
  * Get /signup
  * Post /signup

* Log in as a User
  * Get /login
  * Post /login

* CRUD on Games (Create, Read, Update, Delete)
  * Get /games          #index index page to display all games
  * Get /games/new      #displays create games form
  * Post /games         #create action creates one game
  * Get /games/:id      #show action displays one game based on ID in the url 
  * Get /games/:id/edit #edit action displays edit based on ID in the url
  * Patch /games/:id    #update action modifies an existing game
  * Delete /games/:id   #delete action delete based on ID in the url


All Played Games Collections:

User Login/SignUp/Password
Game Platform => Console game, Online game, PC game, Mobile Game, Board game, Drinking game
Game Genre => Adventure, Shooter, RPG, MMORPG, Simulation
Game Mode => Single Player, Multiplayers
Game Name => Name
---------------
| Platform    |
---------------
| Mode        |
---------------
| Name (genre)|
---------------