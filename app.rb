# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

# Describe what the class is doing
class Bookmark < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark'
  end

  run! if app_file == $PROGRAM_NAME
end
