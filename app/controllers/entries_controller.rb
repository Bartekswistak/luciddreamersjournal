class EntriesController < ApplicationController

  get '/create_entry' do
    erb :'entries/create_entry'
  end

  post '/entries' do
    if params[:content] == ""
      redirect to '/entries/create_entry'
    else
      user = User.find_by_id(session[:user_id])
      @entry = Entry.create(:content => params[:content], :date => params[:date], :user_id => user.id)
      redirect to '/entries/show'
    end
  end

  get '/entries/show' do
    erb :'/entries/show'
  end


end
