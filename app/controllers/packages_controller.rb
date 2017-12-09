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
    @package = Package.find(params[:id])
    if logged_in?
      if @package.user == current_user
        erb :'/packages/show'
      else
        redirect '/packages'
      end
    else
      redirect '/'
    end
  end

  get '/packages/:id/edit' do
    @package = Package.find(params[:id])
    if logged_in?
      if @package.user == current_user
        erb :'/packages/edit'
      else
        redirect '/packages'
      end
    else
      redirect '/'
    end
  end

  patch '/packages/:id' do
    @package = Package.find(params[:id])
    @package.update(params)
    redirect "/packages/#{@package.id}"
  end



end
