require 'sinatra/base'

class MyApp < Sinatra::Base
  enable :sessions
  set :session_secret, "here be dragons"

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    session[:player1name] = params['player1']
    session[:player2name] = params['player2']
    session[:player2hp] = 60
    redirect to('/play')
  end

  get '/play' do
    @player1name = session[:player1name]
    @player2name = session[:player2name]
    @player2hp = session[:player2hp]
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
