require 'sinatra/base'
require './lib/bookmarks'

class BookmarkApp < Sinatra::Base
  enable :sessions

  get '/' do
    # p ENV
    erb :home
  end

  post '/bookmarks' do
    Bookmarks.add(url: params['url'])
    # session[:bookmarks] = Bookmarks.view_all
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.view_all
    # @bookmarks = session[:bookmarks]
    erb :bookmarks
  end

  post '/bookmarks/add' do
    # @bookmarks = session[:bookmarks]
    # session[:add_bookmark] = Bookmarks.add
    redirect '/bookmarks'
  end

  get '/bookmarks/add' do
    # Bookmarks.add(url: params['url'])
    # @bookmarks = session[:bookmarks]
    erb :"bookmarks/add"
  end

  run! if app_file == $0
end
