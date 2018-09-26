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
    if Bookmarks.valid_url?(params['url'])
      Bookmarks.add(url: params['url'])
    else
      flash[:alert] = "URL not valid"
    end
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
