require './config/environment'

require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  use Rack::Flash, :sweep => true
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

  get '/playtime' do
    erb :'/info/playtime'
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end

end
