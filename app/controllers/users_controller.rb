class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/packages'
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id
    redirect '/packages'
  end

  get '/login' do
    if logged_in?
      redirect '/packages'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/packages'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end
end
