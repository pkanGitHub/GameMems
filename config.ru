require_relative 'config/environment'

use Rack::MethodOverride

use SessionsController
use GamesController
run ApplicationController