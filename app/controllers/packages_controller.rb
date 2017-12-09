class PackagesController < ApplicationController

  get '/packages' do
    if logged_in?
      current_user
      erb :"packages/index"
    else
      redirect '/'
    end

  end

end
