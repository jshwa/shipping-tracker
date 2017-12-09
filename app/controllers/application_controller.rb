require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shipping_tracker_secret"
  end

  get '/' do
    "hello"
  end

end
