class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/packages'
    else
      erb :'/users/create_user'
    end
  end

  post '/users' do
    user = User.create(params)
    session[user_id] = user.id
    redirect '/packages'
  end

end
