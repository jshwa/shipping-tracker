class PackagesController < ApplicationController

  get '/senders' do
    if logged_in?
      @senders = current_user.senders
      erb :index
    else
      '/'
    end
  end

end
