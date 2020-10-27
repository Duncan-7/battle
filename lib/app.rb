require 'sinatra/base'
require './lib/player'

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
    redirect to('/play')
  end

  get '/play' do
    p $player1
    @player1name = $player1.name
    @player2name = $player2.name
    @attacked = params[:attacked]
    if @attacked
      $player2.take_damage
    end
    @player2hp = $player2.hp
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
