class EntriesController < ApplicationController

  get '/create_entry' do
    erb :'entries/create_entry'
  end

  post '/entries' do
    
  end

end
