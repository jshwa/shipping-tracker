require './confid/environment'

class ApplicationController < ActiveRecord::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shipping_tracker_secret"
  end

end
