require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmarks'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  post '/bookmarks' do
    flash[:notice] = "URL not valid" unless Bookmarks.add(url: params['url']) 
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.view_all
    erb :bookmarks
  end

  post '/bookmarks/add' do
    redirect '/bookmarks'
  end

  get '/bookmarks/add' do
    erb :"bookmarks/add"
  end

  run! if app_file == $0
end
