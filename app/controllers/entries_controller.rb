class EntriesController < ApplicationController

  get '/entries/entries' do
    if session[:user_id]
      @entries = Entry.all
      erb :'entries/entries'
    else
      redirect to '/login'
    end
  end

  get '/create_entry' do
    if session[:user_id]
      erb :'entries/create_entry'
    else
      redirect to '/login'
    end
  end

  post '/entries' do
    if params[:content] == ""
      redirect to '/entries/create_entry'
    else
      user = User.find_by_id(session[:user_id])
      @entry = Entry.create(:content => params[:content], :date => params[:date], :user_id => user.id)
      redirect to '/entries/entries'
    end
  end



end
