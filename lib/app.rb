require 'sinatra/base'
require 'player'

class MyApp < Sinatra::Base
  enable :sessions
  set :session_secret, "here be dragons"

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    $player1 = Player.new(params['player1'])
    $player2 = Player.new(params['player2'])
    session[:player2hp] = 60
    redirect to('/play')
  end

  get '/play' do
    @player1name = $player1.name
    @player2name = $player2.name
    @player2hp = session[:player2hp]
    @attacked = params[:attacked]
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
