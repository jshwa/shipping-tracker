class PackagesController < ApplicationController

  get '/packages' do
    if logged_in?
      current_user
      erb :"packages/index"
    else
      redirect '/'
    end
  end

  get '/packages/:id' do
    package = Package.find(params[:id])
    if logged_in?
      if package.user == current_user
        erb :'/packages/show'
      else
        redirect '/packages'
      end
    else
      redirect '/'
    end
  end
end
