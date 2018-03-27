require './config/environment'

class ApplicationController < Sinatra::Base

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "lucid_secret"
end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :'/info/about'
  end

  get '/tips' do
    erb :'/info/tips'
  end

end
