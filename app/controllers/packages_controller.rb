class PackagesController < ApplicationController

  get '/packages' do
    if logged_in?
      current_user
      erb :"packages/index"
    else
      redirect to '/'
    end
  end

  get '/packages/new' do
    if logged_in?
      erb :"/packages/new"
    else
      redirect to '/'
    end
  end

  post '/packages' do
    package = current_user.packages.create(params[:package])
    package.sender = Sender.find_or_create_by(name: params[:sender][:name].capitalize)
    package.save
    redirect to "/packages/#{package.id}"
  end

  get '/packages/:id' do
    @package = Package.find(params[:id])
    if logged_in?
      if @package.user == current_user
        erb :'/packages/show'
      else
        redirect to '/packages'
      end
    else
      redirect to '/'
    end
  end

  get '/packages/:id/edit' do
    @package = Package.find(params[:id])
    if logged_in?
      if @package.user == current_user
        erb :'/packages/edit'
      else
        redirect to '/packages'
      end
    else
      redirect to '/'
    end
  end

  patch '/packages/:id' do
    @package = Package.find(params[:id])
    @package.update(params[:package])
    @package.sender = Sender.find_or_create_by(name: params[:sender][:name])
    @package.save
    redirect to "/packages/#{@package.id}"
  end

end
