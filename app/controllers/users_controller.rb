class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/users' do
    user = User.create(params)
    session[user_id] = user.id
    redirect '/packages'
  end

end
