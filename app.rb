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
    erb(:index)
  end

	post '/add_bookmarks' do
		url = params[:url]
		title = params[:title]
		Bookmarks.create(url,title)
		redirect '/bookmarks'
	end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  run! if app_file == $PROGRAM_NAME
end
