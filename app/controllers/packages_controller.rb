class PackagesController < ApplicationController

  get '/packages' do
    if logged_in?
      erb :"packages/index"
    else
      redirect to '/'
    end
  end

  get '/packages/new' do
    if logged_in?
      @errors = []
      erb :"/packages/new"
    else
      redirect to '/'
    end
  end

  post '/packages' do
    if params[:sender] == nil
      current_user
      @errors = ["You must fill in a sender"]
      erb :'/packages/new'
    else
      package = current_user.packages.create(params[:package])

      if params[:package][:shipping_co] == ""
        package.shipping_co = params[:alt_package][:shipping_co]
      end

      if params[:sender][:name].empty?
        package.sender = Sender.find_or_create_by(name: params[:alt_sender][:name].capitalize)
      else
        package.sender = Sender.find_by(name: params[:sender][:name])
      end

      package.save
      redirect to "/packages/#{package.id}"
    end
  end

  get '/packages/:id' do
    if logged_in?
      if @package = current_user.packages.find_by(id: params[:id])
        erb :'/packages/show'
      else
        redirect to '/packages'
      end
    else
      redirect to '/'
    end
  end

  get '/packages/:id/edit' do
    if logged_in?
      if @package = current_user.packages.find_by(id: params[:id])
        erb :'/packages/edit'
      else
        redirect to '/packages'
      end
    else
      redirect to '/'
    end
  end

  patch '/packages/:id' do
    if logged_in?
      if @package = current_user.packages.find_by(id: params[:id])
        @package.update(params[:package])

        if params[:package][:shipping_co] == ""
          @package.shipping_co = params[:alt_package][:shipping_co]
        end

        if params[:sender][:name].empty?
          @package.sender = Sender.find_or_create_by(name: params[:alt_sender][:name].capitalize)
        else
          @package.sender = Sender.find_by(name: params[:sender][:name])
        end
        @package.save
        redirect to "/packages/#{@package.id}"
      else
        redirect to '/'
      end
    else
      redirect to "/"
    end
  end

  delete '/packages/:id/delete' do
    if logged_in?
      if @package = current_user.packages.find_by(id: params[:id])
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
