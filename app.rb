# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

# Describe what the class is doing
require './lib/bookmarks'
class Bookmark < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:create_bookmarks)
  end
	
	get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end
	
	post '/bookmarks/new' do
		url = params[:url]
		title = params[:title]
		Bookmarks.create(url,title)
		redirect '/bookmarks'
	end  

	delete '/bookmarks/:id' do
		@entry = params[:id]
		Bookmarks.delete(@entry)
		redirect '/bookmarks'
	end

  run! if app_file == $PROGRAM_NAME
end
