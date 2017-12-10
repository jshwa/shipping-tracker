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
      current_user
      erb :"/packages/new"
    else
      redirect to '/'
    end
  end

  post '/packages' do
    package = current_user.packages.create(params[:package])

    package.shipping_co = params[:alt_package][:shipping_co] if !params[:alt_package][:shipping_co].empty?
    
    if params[:sender][:name].empty?
      package.sender = Sender.find_or_create_by(name: params[:alt_sender][:name].capitalize)
    else
      package.sender = Sender.find_by(name: params[:sender][:name])
    end

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
    @package.shipping_co = params[:alt_package][:shipping_co] if !params[:alt_package][:shipping_co].empty?
    if params[:sender][:name].empty?
      @package.sender = Sender.find_or_create_by(name: params[:alt_sender][:name].capitalize)
    else
      @package.sender = Sender.find_by(name: params[:sender][:name])
    end
    @package.save
    redirect to "/packages/#{@package.id}"
  end

  delete '/packages/:id/delete' do
    if logged_in?
      package = Package.find(params[:id])
      if package.user == current_user
        package.destroy
        redirect to "/packages"
      else
        redirect to "/packages"
      end
    else
      redirect to '/'
    end
  end

end
