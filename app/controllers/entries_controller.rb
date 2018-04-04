class EntriesController < ApplicationController

  get '/entries/entries' do
    if session[:user_id]
      @entries = Entry.find_each do |entry|
        entry.user_id == current_user.id
      end
      @entries
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

  get '/entries/:id' do
   if session[:user_id]
     @entry = Entry.find_by_id(params[:id])
     erb :'entries/show'
   else
     redirect to '/login'
   end
 end

 get '/entries/:id/edit' do
   if session[:user_id]
     @entry = Entry.find_by_id(params[:id])
     if @entry.user_id == session[:user_id]
      erb :'entries/edit'
     else
       redirect to '/entries/entries'
     end
   else
     redirect to '/login'
   end
 end

 post '/entries/:id' do
    if params[:content] == ""
      redirect to "/entries/#{params[:id]}/edit"
    else
      @entry = Entry.find_by_id(params[:id])
      @entry.content = params[:content]
      @entry.save
      redirect to "/entries/#{@entry.id}"
    end
  end

  post '/entries/:id/delete' do
    @entry = Entry.find_by_id(params[:id])
    if session[:user_id]
      @entry = Entry.find_by_id(params[:id])
      if @entry.user_id == session[:user_id]
        @entry.delete
        redirect to '/entries/entries'
      else
        redirect to '/entries/entries'
      end
    else
      redirect to '/login'
    end
  end

end
